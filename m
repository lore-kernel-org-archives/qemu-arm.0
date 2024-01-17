Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1406301ejf;
        Wed, 17 Jan 2024 00:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrUHN8Y+kivPeFpz286mvI9KFIqE/PYqe4kZ392IOXx70h8XpQs9zm5h7wenNjacEuePzY
X-Received: by 2002:ac8:584d:0:b0:429:f3d2:6dfc with SMTP id h13-20020ac8584d000000b00429f3d26dfcmr4515857qth.96.1705480879003;
        Wed, 17 Jan 2024 00:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705480878; cv=none;
        d=google.com; s=arc-20160816;
        b=DKvAVFB1Vr33owFGTymv3lvbae5IGzSX61jop+lTiStQQdYhBbrCROqRZPkiuBsQZJ
         s8br3xXbyYxUzf1ANLQXiN7J8g7100Aw/ImQ/kCesHTgxHbRFL/JB8T+EmOmxDQnGbub
         KanxHJkKuCkkhLgeDyFSolcKchB3o74CYyzjB2YikPyQ4dzj7Ke8PYEpna8F7qSGUMA6
         fZ+Me2hVyhrqExnVNP0SYrvnHDVc3C1BhG+qvSaAW9YevutY2r0IYYSpIlvZVg9uqGlH
         S7rjgMu+ojBQ5MmEoLccrAtaWDZDeHlFwQnaDe6b8aZljYsP8QAILvrEQPbjfnec/idc
         /cTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=FbexiVYUa4f5Ut9Oc53ij44ge22AhxP47f1RuO8L+B4=;
        fh=Bj3iOVmu1clgG+pZT8H/mySoK2b13K3HhEi6cJJAapU=;
        b=MkIXZYz2aaTLAmQtcEsnBwjCiDbDycyJS8u3CvX4PdLUpFyCpmBE23d+PwiHERB+e0
         azDc8+0Bpb5XGocSolaUN8kCQIicFUr1Qw6gIfTSlxqmTVaGMTCSN5R+C1ThxkZ6D0FC
         dwVpnjhZp8VQ/RfHMBxG6sgkykGUajIx3szxEAY1deh+JTtVYVI8yQpFqfP4DaRNGF09
         ZttBqbbPe1Z5IKvaiou1mdV1oDQ3EvCjtYKd/ZjmoSv2xfNqJbHbVliypL4a5hNBbo3l
         LYx61MmYqrlS8kPa8/a4a9yMygBcLYtbXENA21ThDhYZKvbiR5mMXdBru27Su2NJHDj7
         jXog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBLzpYXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ac85f95000000b00429c7bb667csi11047576qta.51.2024.01.17.00.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:41:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBLzpYXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ1Tr-0007xf-A6; Wed, 17 Jan 2024 03:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rQ1Tm-0007x4-Rc
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:40:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rQ1Tk-00014v-T3
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705480856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbexiVYUa4f5Ut9Oc53ij44ge22AhxP47f1RuO8L+B4=;
 b=FBLzpYXFmOa+otcsTIadhBZ0NO4kBDQ90ZtmXzoB+oT2A0blCo1jonQFzwuOAcIFry3KSy
 ztFHTgx32BGAyNQ6I1jBPuWhFIY3Ft3+G/TzYWb8reVB+m2u0Q7dq+8j0qfTJzP8EL+rqD
 VVYG3ia7WYzIZRv4kYQq/Ew6sWkrnY8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-bpuNONVpN_qvAKyMTUvyWA-1; Wed, 17 Jan 2024 03:40:55 -0500
X-MC-Unique: bpuNONVpN_qvAKyMTUvyWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e5f548313so48851395e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jan 2024 00:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705480853; x=1706085653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbexiVYUa4f5Ut9Oc53ij44ge22AhxP47f1RuO8L+B4=;
 b=BpJH7GFAv195QC2Getyw5n9ktITSNmRR0PvoIT38qD5Wjpt5EfD9PpEAJODCuO6geb
 MHbk1Aesvn6MXBDsYtAD4he+0VCS7FDYUaJwVyZ+6ZBtFHSMrBR+q2XjVbih10Q81cuh
 Lb52etTUnYnUvqDv6aTaqRtdrmFwIMXCCj+KeB4nhX50lTXbrXxaHTu14vd2sW5Fh0oo
 iQqDnP7jEUOmh9pRZcH3fvuNWGfejOi/BkyhZRzPI+Dc2niAZDsl+I7dvEkXxw+gAXh8
 TR1LI5kKnoLZUvkchkUBbGiLpaOan+ExhZpk7ozzeWpAbW7039ZeE7VUgcxHlNi5hk0n
 2OIA==
X-Gm-Message-State: AOJu0YzbqWSXLjNA6ME69SZYFX2IJXX4g7u59fPfv6734ueDx7YQTkih
 iDkH1kQBllmOsskGYXZhflKH1TjfECrjUdBL69K5dNNq/hpo2OL6d+6LEuVaBQMStmt/5HI6snA
 TurD1k5qBgdiEyFpRX5gBhzHwM+3r
X-Received: by 2002:a1c:6a03:0:b0:40e:6948:3226 with SMTP id
 f3-20020a1c6a03000000b0040e69483226mr3655427wmc.134.1705480853239; 
 Wed, 17 Jan 2024 00:40:53 -0800 (PST)
X-Received: by 2002:a1c:6a03:0:b0:40e:6948:3226 with SMTP id
 f3-20020a1c6a03000000b0040e69483226mr3655421wmc.134.1705480852957; 
 Wed, 17 Jan 2024 00:40:52 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0040d1bd0e716sm21834056wmq.9.2024.01.17.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 00:40:52 -0800 (PST)
Date: Wed, 17 Jan 2024 09:40:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Felix Wu <flwu@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] SMBIOS type 8 should use T8_BASE.
Message-ID: <20240117094051.401b6316@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240117093847.5dc92824@imammedo.users.ipa.redhat.com>
References: <20240111192522.2795498-1-flwu@google.com>
 <20240111192522.2795498-2-flwu@google.com>
 <20240117093847.5dc92824@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pYbhj6e6zIpC

On Wed, 17 Jan 2024 09:38:47 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 11 Jan 2024 19:25:22 +0000
> Felix Wu <flwu@google.com> wrote:
> 
> it is missing Signed-off tag a minimum, and also commit message should describe in more detail
> what's wrong and what's breaks and how it's being fixed with references to spec preferably. 
> 
> please see https://www.qemu.org/docs/master/devel/submitting-a-patch.html
> for requirements to commit message of the patch.
>

on top of that pls consider adding test case for it in
tests/qtest/bios-tables-test.c

> > ---
> >  hw/smbios/smbios.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 2a90601ac5..7dda84b284 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -591,6 +591,7 @@ bool smbios_skip_table(uint8_t type, bool required_table)
> >  #define T2_BASE 0x200
> >  #define T3_BASE 0x300
> >  #define T4_BASE 0x400
> > +#define T8_BASE 0x800
> >  #define T11_BASE 0xe00
> >  
> >  #define T16_BASE 0x1000
> > @@ -775,7 +776,7 @@ static void smbios_build_type_8_table(void)
> >      struct type8_instance *t8;
> >  
> >      QTAILQ_FOREACH(t8, &type8, next) {
> > -        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
> > +        SMBIOS_BUILD_TABLE_PRE(8, T8_BASE + instance, true);  
> 
> we can't do that unconditionally as it will break live migration
> where firmware reading this might get part of broken tables (on source host)
> and 2nd part of fixed ones (from target host).
> 
> So we need to use T0_base for old machine types and T8_BASE for
> default/new machine types.
> for example see how 'pcmc->smbios_uuid_encoded' is used.
> unless it's x86 specific, this should be done for affected machine types.
>   
> >          SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
> >          SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);  
> 

