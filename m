Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp11005455lfq;
        Tue, 29 Dec 2020 03:31:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOcrzrg/A3T0ohCqPhW8SpYiPSCRRWqw1buCpZTYl3d9YGSTgdqkrAYWnA1d7DTKNv2B4u
X-Received: by 2002:a25:25c2:: with SMTP id l185mr68612604ybl.140.1609241518712;
        Tue, 29 Dec 2020 03:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609241518; cv=none;
        d=google.com; s=arc-20160816;
        b=UR40xJ8yNRXYw/QjqvLFJ5wfugUwI8cgWKN3JazDwBr3+ie9+2CCi4RT1mCh4GFmsx
         A7sdeTJu3y37AsCIm2HiSfcLHiTVk1ckx133gt1ZftTFxTZsxYpnr5k2m2XX2b/Zr+7e
         8P09lQNfEJkLCxyJvZAUHyG2ZAiAGqVBCIlD7e43QVk5bdJvIf81LrhbpaGQC7jM+zm9
         l6wGD4RUzHeJ6/ZKdBxnUfmPL0fte6LBuucoIYnY9tze7x3Yzd5HPSXH4CXbIO39yW4e
         YM9OUCS/GAHuyumiQoFpI0yb/n/LxaNhWhLo9ZuNObWcmKGXdEH567N9s7Rc25lmGKgZ
         FYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Af6WOi56EjHz65nCJbhiCPwlx7bq/OTWInbgG1l9JxE=;
        b=iZif7N1NFntXRauQm72f+7gt7bgoTCnwgVizh3DOJj+Oi4+vvlTaDD4Jc8o5AH75fs
         rCEs8Aci9N2bbgBVvaD7q4WhlKwW4/UMc7iecPAnbmuhZH9HvKUXyPEt+l/N985+phWt
         OhP7IKtpMDCQNDsuz6u2LZXDFYOJSqb23D6rk3q2ZUDXrsICrEHoE9T+LhMiAJ79Y1aU
         yRfVUqBVYMSJ8VVEKR+HyuqCKusQKWis79WoO0zgVOeJKGdRLEgdjdCurJpHfk1T/cbj
         zaL3+t++tRZP3f7JiFySuVE6Pug35ME3KyngMU/N2anLfRdaDnbEoYvxjbhf74/avN0V
         NG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wiyg0DY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si38324913ybt.39.2020.12.29.03.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Dec 2020 03:31:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wiyg0DY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuDEM-0001ss-2h
	for alex.bennee@linaro.org; Tue, 29 Dec 2020 06:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuDE6-0001rk-M6
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 06:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuDE1-000823-Bj
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 06:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609241491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Af6WOi56EjHz65nCJbhiCPwlx7bq/OTWInbgG1l9JxE=;
 b=Wiyg0DY1j6p3axweAFqY5PGb11C6qy2UaQgVVYiWWgGFwjeI2QemGenBswYdGiF/230o9b
 +s4usqPAF2TAkkWdbSvsOSES0WNXidzEk/kjU/TAjZIiyCAJBwzR1bD2L12/SnWlwUb1HD
 WVNmux/P512M/2nCRr9xMgh6KHliNWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-8P_X3J72NW-vxJrPcABivw-1; Tue, 29 Dec 2020 06:31:29 -0500
X-MC-Unique: 8P_X3J72NW-vxJrPcABivw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B40D6801817;
 Tue, 29 Dec 2020 11:31:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1818060BE5;
 Tue, 29 Dec 2020 11:31:19 +0000 (UTC)
Date: Tue, 29 Dec 2020 12:31:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Posteuca <posteuca@mutex.one>
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20201229123118.64e1a41f@redhat.com>
In-Reply-To: <878s9onq41.fsf@mutex.one>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <20201223115445.71dc9f8c@redhat.com> <878s9onq41.fsf@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Dongjiu Geng <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tG1awoKrITM8

On Wed, 23 Dec 2020 23:56:30 +0200
Marian Posteuca <posteuca@mutex.one> wrote:

> Thanks for the thorough review.
> 
> Igor Mammedov <imammedo@redhat.com> writes:
> > On Tue, 22 Dec 2020 13:33:53 +0200
> > Marian Posteuca <posteuca@mutex.one> wrote:
> >
> > I see defaults are now initialized in pcmc->oem_[table_]id fields,
> > and sometimes used from there, so question is why
> > do we need use_sig_oem and keeping old code
> >
> >     if (oem_id) {                                                                
> >         strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);                    
> >     } else {                                                                     
> >         memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);                               
> >     }                                                                            
> >                                                                                  
> >     if ()) {                                                          
> >         strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id)); 
> >     } else {                                                                     
> >         memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);                         
> >         memcpy(h->oem_table_id + 4, sig, 4);                                     
> >     }  
> > I'd rather drop 'else' branches altogether and simplify to something like this
> >
> > g_assert(oem_id);
> > strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
> > g_assert(oem_table_id)
> > strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
> > + padding
> >
> > and make sure ids are properly propagated everywhere.
> >  
> 
> I'm not sure if I understood this point correctly. You want to remove the appending
> of the sig part to the oem_table_id field, and just use whatever is
> passed by the caller for oem_table_id?
yes, according to spec unique oem_table_id helps only in distinguishing different
pieces of DSDT/SSDT tables, for other tables it doesn't make any sense to make it unique.
and this matches what real machines do.

