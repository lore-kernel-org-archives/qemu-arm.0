Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp397876ejb;
        Wed, 6 Mar 2024 01:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdv3vl26NA4CHENM7KjWw1KYQThs1BW70Qa6VO2JV2omVWaqohTl4+OOna/Ro/fhfQFYzJDz3cRzp+ZSolHI2JFHqLDNs9
X-Google-Smtp-Source: AGHT+IET/rVn5WZ3TckEL7sfAAyi0jsYaQ/6KnmKkma+2/OoXRZElgF2lXfCkKQ49bgpbTNgsdxt
X-Received: by 2002:ad4:43c1:0:b0:690:99ac:e6f1 with SMTP id o1-20020ad443c1000000b0069099ace6f1mr255152qvs.25.1709719159073;
        Wed, 06 Mar 2024 01:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709719159; cv=none;
        d=google.com; s=arc-20160816;
        b=GWeyCgKnYWmABUbAz6jATib42PRfvZaWEsqLOl7vcoHB+VMst5xBGiTPWtBa3udxCa
         9DTX1aMndk/W7UII9/RH6wcFPCih2L877syKCY0yAbV2rxwtKkjVqGZmyN/1KKdQY2z9
         6RpxmlRoQbhrx6oxN8L8CA1GODITCjhafTvUm+0EgeyYyVd5ZK2ZiB8GI3RHhPJCAins
         EkB4QaV3M96ihgCvnGPRNe+Vopxu6SqGQE9m0461aJQwU/wJC7UlGDXsjDZTKDAan6kk
         DkHxzZUJpY520scWh3hfg7drjnmQ3aRpb0Y2yWdtjuXsyoOtoIUAbqnaYeTiX7oIma6U
         G/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=TjnZmIUcmHzFi9LsiWqY4kNxYi8GVZnUFGXEFsHl6CM=;
        fh=KTmI7GhyVFj4Mf/23YOAGQsqM+CNNYAcx9kRoscSoTM=;
        b=W4mtZsPj+grS47pM6OUtnBx9d4zqADqFjYXAHZZ6wBZUB/V0yyKeO9Fg+JYlB7V7Xd
         t9T/FxtIOW0fiK1UxblXny4e+J8G0PzEklpdQxAbrgOPAvsNpurDv7UjFS73UE01YGmS
         moh6dfe1E4AWVDriykiTMiygElHA01vnu6gbzMvrDbgPqhVyAziV4otYdZI2JXBpZMRV
         BCBXMNEab0oYodexsI6YWSYHhNa7X87bVhaVC0+hMtFOe+curVeizS10MAp+pQaBIHBY
         r+KIJmk3MJ5/yPv2iF6jWpO0rvyhdOLeDNgudr1y0oUokTs+zk0DN/OADU/uVjEXSaRG
         6RTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H+3JkNJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kr29-20020a0562142b9d00b0068ce8312e21si13504045qvb.415.2024.03.06.01.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 01:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H+3JkNJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rho3N-0004Ob-5U; Wed, 06 Mar 2024 04:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rho3L-0004OF-KU
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 04:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rho3G-0003O5-LB
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 04:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709719145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjnZmIUcmHzFi9LsiWqY4kNxYi8GVZnUFGXEFsHl6CM=;
 b=H+3JkNJ3iq9afOXZrwRIz3JavhxP05LeyPLqwXWAXi7e6Pv4wX7lSsB6Rq60eVptg/wrP9
 Gnb1+eV0emxZeNCnw4Ii89k3sMvjOMC63tCBAEzra3VU+K8ib1+VqL2uWAK+H1FvMfaAG0
 e976uadil2ph/i2YodjFTj0A5NGjDv4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-CFevkXW7NKiNNTd9vpyjug-1; Wed, 06 Mar 2024 04:59:04 -0500
X-MC-Unique: CFevkXW7NKiNNTd9vpyjug-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7817253831cso1056279185a.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 01:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709719143; x=1710323943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjnZmIUcmHzFi9LsiWqY4kNxYi8GVZnUFGXEFsHl6CM=;
 b=E1d8zKnvUnjanVsdSrE7ReTAmT0q1lX5EvaNWn3/GEhA9usCFhFso0v/RdUApwPhgf
 kmkov6Y8K1ep1gq+sQ5yXAzT4ceYoY1olNPJeFimfdXbUxQFGCOHr9cvIYWZ4uOOpFVs
 eSAW3VCGK/KdML7z0KGePlukGelS+t6K+wCI5XOCxq4SabPDxz86ZPwrau5YRZXnWLk1
 7LVljCd9O0p8PNOljAWoqnPTbrG8oyz/8Tgp4l/BB/T2MkQT5L5jPoUtBWYEMKfZqkxT
 9i5I6K6XXeeEi+bEh19kU0nBFX6IiAbRXAGGLsBMvL4kt85gy8k1/1W8vbwOpZ3WT9gn
 uhiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOWdhsNVVnbcmBu0/m67GOIbrn8qx0X86d9kfjJMf/aIrHwa1EDk3T9FrRI0xSQNz0W46SLmYxBFVZEU6Pq1rNEkVk
X-Gm-Message-State: AOJu0YyCGtLJvXpVwZ5vrH1ixzW479zP0y5kXdqniJTcSIKBI89mHB2v
 IrpLa2Rw/U0+WEYJ0FIauB0V7zl/IWERW/GkPcNxpXzdWQyuVEG7+h/VYy0y7zRFAL+Epazp15y
 EiCNNTBaeQ6O7w5nGTmQsnMC9y2Pulc8PV0dxPukfofS1HKVtfg==
X-Received: by 2002:a05:620a:459f:b0:788:384e:394a with SMTP id
 bp31-20020a05620a459f00b00788384e394amr4515375qkb.74.1709719143589; 
 Wed, 06 Mar 2024 01:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:459f:b0:788:384e:394a with SMTP id
 bp31-20020a05620a459f00b00788384e394amr4515362qkb.74.1709719143302; 
 Wed, 06 Mar 2024 01:59:03 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 bk5-20020a05620a1a0500b007883b9681a6sm950403qkb.26.2024.03.06.01.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 01:59:02 -0800 (PST)
Date: Wed, 6 Mar 2024 10:58:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>, Alistair
 Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH v2 17/20] smbios: clear smbios_type4_count before
 building tables
Message-ID: <20240306105855.232296e4@imammedo.users.ipa.redhat.com>
In-Reply-To: <6A030F09-22CE-4489-9F7A-D7343966DBAC@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-18-imammedo@redhat.com>
 <6A030F09-22CE-4489-9F7A-D7343966DBAC@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: De+sWz5rYoit

On Wed, 6 Mar 2024 13:17:39 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> > On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > it will help to keep type 4 tables accounting correct in case
> > SMBIOS tables are built multiple times.  
> 
> 
> I suggest you arrange this before patch 15 where you are actually calling smbios_get_tables_ep() multiple times. That way there is no window where things can break between patches.

it doesn't break in patch by patch test, because auto is not in use yet.
It could be moved but, I'd rather not respin series for the sake of reordering.

Michael can you reorder it before 15/20 when applying?

> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> > ---
> > hw/smbios/smbios.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index bf5c7a8885..b64d3bc227 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -981,6 +981,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
> >            ep_type == SMBIOS_ENTRY_POINT_TYPE_64);
> > 
> >     g_free(smbios_tables);
> > +    smbios_type4_count = 0;  
> 
> Nit: Can you put this before g_free() because gfree(smbios_tables) and smbios_tables = memdup2() etc are related. This is kind of coming in between.
cleanup is not related to memdup, the later works fine without cleanup.
I'd prefer to keep it as is.

> 
> >     smbios_tables = g_memdup2(usr_blobs, usr_blobs_len);
> >     smbios_tables_len = usr_blobs_len;
> >     smbios_table_max = usr_table_max;
> > -- 
> > 2.39.3
> >   
> 

