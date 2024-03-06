Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp365263ejb;
        Wed, 6 Mar 2024 00:32:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4POVcaE5nGlaL75ZZRKWENLRW9qUqAp2GQ0UbI6DGkmC6e24ZJmHpBhEJna3Efm9NliovKUXhftl95WNTR7SKb7lMve0U
X-Google-Smtp-Source: AGHT+IEUlyJpPHPzTshGK/upAWJpK60KpdAyfljGOJXZXGngiKfYi8t4QkMfIOgK4FNVWRNYVAUt
X-Received: by 2002:a05:6122:4b01:b0:4ca:f519:c25f with SMTP id fc1-20020a0561224b0100b004caf519c25fmr4498327vkb.9.1709713932687;
        Wed, 06 Mar 2024 00:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709713932; cv=none;
        d=google.com; s=arc-20160816;
        b=PZC1oA4FIiC77odAU06kjt7PN6mF+JXi1Ezn0dd++TMGVT7lz+nzhhPEGxJWDeyJ4x
         iDalD8N3FG6lIWU4XFD6pof1V1wMAg7E0YlJwb67vtdey+8BlVJsgWlD6GIJkbVWyGTG
         3Lvc/Yg7kokyt4h/KNQCzIXxWCt1IrZDbYtsgoKd7POa70pXkWpDt+Zw56sRnVBuCnxP
         4UfIaV3iiqckSM5FqEQI5bzErp/D6zMb3g6aIF9qkZ10YQSM4VX486SQ8RoYCQjbHFYJ
         3B3fhw9ORns868aAZ1A9ZgGlOZEg/M0DtREBvzMZpEcOWVlbceqk7doT3d8Vlpc967UT
         MGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=vPRUi+C5EkdovKeQQ5z9IaspJl4n81Xh/DeurUO/bNU=;
        fh=giRyZQmg+1hJfPUl5rpAQBIpENBNiRKfntyDTeQjXUY=;
        b=jrxLyvIi9jLS38MMzD9N3hPSDgfJAuxvE0OR8ykkGjw+IRu/OzMDeXVGsWqqaPlcSD
         EuNM0uQqNjKH0d9GwJHblyYhH3QVfzR4LjG0MnOU06MB0dIcoEgun8ClY+G4aoNPm/21
         sDf5N2E0zoZ+vjWCOHD93b1Tsv71OJDlK8ArMxhLFJeOyRVuMq58/r9W+xByLP1gOCAF
         gY4jE6bcHblcK8IIzuNdVC6FhyMVe98gSncDRkjgWjBidlyp+Q4cUgOjkDyiq9JPhS8/
         +W86LucTplQ5yScztTVNepUUACxGNS1eV5u3ntcD6Dp5vGWUM2xyTVoe4isuWEvVQLtq
         6+2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEQiXQKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac85988000000b0042ef7a1dd98si5252261qte.240.2024.03.06.00.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 00:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEQiXQKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhmgs-0001VP-VQ; Wed, 06 Mar 2024 03:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhmgo-0001UT-Vu
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhmgn-0006ih-8q
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709713908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPRUi+C5EkdovKeQQ5z9IaspJl4n81Xh/DeurUO/bNU=;
 b=JEQiXQKB9dALyYhVM/vomjlGp9YG9z99wk21Ux2juqGWs8VUkKPUrm/ZgJp6prUV2C3+YU
 SwKzWaC3rCE1m/1JA0w/49OL3dyZsrf6M7ZgQ1SPUCh6hE/fJEuBAz9p10t0bghWiVOSTt
 1ovou11nUTwD+ZrKtayVEDr6LE8/GNk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Fwrt0HPANkuBKFIG5qqOHQ-1; Wed, 06 Mar 2024 03:31:46 -0500
X-MC-Unique: Fwrt0HPANkuBKFIG5qqOHQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6e5ce471890so3819828b3a.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 00:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709713904; x=1710318704;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8Q8szHIH1Jm+/Qv/JLBLHMcFrjMbttCLOAe1ZNJ3n0=;
 b=qEx3u/B36435cAMC32jPAodlt1L+UpVLAf3IyTRDu0Bu1vki2R3t4ymR5b2w9pY3fu
 6UT35cqA9aXO5HGmOMaXiS2NCt0I5cMxGUOe4ohhAwPnPE8FU3ogoRiSsHwNDkl4uaB2
 CR53WV06FndbZUL9S7EQkS9frblzm6aHUiuI9HalIcKKGLZozkEAQiy1Gbfvz/Qr5rOr
 02mms4dsWLH5hVw7EorBmAL+Chu7E0C2deYR8YcBtwjCT5SOmzaf6unR6FzINwsSF7fq
 5ziJkaGz9pEifBjsKz7e5EJekb3+Yc+tGcQPAWC1CiFzD4gDGdS8LhVupJoXqLoUHZfa
 dphg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXyON3XuVz1g9mpVwStQhkPM7vbEYcRkaO9te5ie5TVqFkjpKIWgDwwBAqqJpaDqf2UD2lDnf4eUqcE18GmRWDR8fu
X-Gm-Message-State: AOJu0YxANBgS6K12E9Rk5QrsU6cp+ROZcbubuqjVAwIy48liTGRRYvFA
 Fr8C3iQRkcEVxx3aiYN7qn+pQr+O+RjWUxZX+3MU6Z8FMDT9+ifo1LeUp7t9a0jLKGzwyt6QLZ9
 0FNkqXWDRMKYajAGzDdAUCJXgumtWkrsTsT1y5FaKUyKGmZYHNA==
X-Received: by 2002:a05:6a00:2315:b0:6e5:61d5:d49f with SMTP id
 h21-20020a056a00231500b006e561d5d49fmr14301065pfh.26.1709713904198; 
 Wed, 06 Mar 2024 00:31:44 -0800 (PST)
X-Received: by 2002:a05:6a00:2315:b0:6e5:61d5:d49f with SMTP id
 h21-20020a056a00231500b006e561d5d49fmr14301047pfh.26.1709713903791; 
 Wed, 06 Mar 2024 00:31:43 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm10234846pfn.187.2024.03.06.00.31.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Mar 2024 00:31:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 18/20] tests: acpi/smbios: whitelist expected blobs
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-19-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 14:01:26 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <AF322AD5-D867-443A-842E-6D5DC7AB1738@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-19-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: QN8u1apIvNX7



> On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Ani Sinha <anisinha@redhat.com>

> ---
> tests/qtest/bios-tables-test-allowed-diff.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..81148a604f 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
> /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/SSDT.dimmpxm",
> --=20
> 2.39.3
>=20

