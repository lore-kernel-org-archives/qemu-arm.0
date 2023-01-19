Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp244167ejc;
        Thu, 19 Jan 2023 03:09:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuFx8Y75z3hthVLGJu8eatxY5Evbq0Sn7A6u2pkmX9axrt+gYkOq1SU0SElio62wD91K0on
X-Received: by 2002:a05:622a:114a:b0:3b6:3a7a:d3c8 with SMTP id f10-20020a05622a114a00b003b63a7ad3c8mr15538062qty.17.1674126555299;
        Thu, 19 Jan 2023 03:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674126555; cv=none;
        d=google.com; s=arc-20160816;
        b=MitNbKXNN+pKeOmESTewZvP6wdsjm6WCNUwUrvsDbgNTeGoWvCZ5hL/05PgRsqP27Q
         9KH78muusHpUxXA7Tn0+JZZmakLIOmOI6AOcwzTOLkbbUeovyy6dwXm3NBB0M6g1LvmF
         +FBEDbUcJ12s5TSaoblD6D3BjPsHJjDx2AoI94SxtiW4Wx1cN/RtmhNIMXW5HyvvI10E
         GtO/7OiGfTL2Alu/M5w6kemxDqoTVFyezvZw7sIEfni6pH09XdqX9lU/txzVsMnuqEpn
         7/T+PKsiPv8ZWdubpmOr0DALXhQdWqa6fG6f1wRa+qDHfFksugjy0wpmDBj3bywaa5sO
         1CFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=bJyY5SyRPd05rQpITcjmKdkYdCswBH9bA+C1ckXwwII=;
        b=y9lhgNYYGjE20/d5OZi8chQVoVfqikpxwUuF8J104hjLhwBn5rYqbSo5yK14nIAr4V
         TX8SPJA4UaLmtI69IdDH3Tu8Q4tmjsgHv3KSx8K3BNsEXH5ErnW/E8+YOTDHTMzY18gP
         CHbdFIa5ZPtI9Re7ocx8TdDfUkJxlcQKcAiCGbTKhuKewXdQ8ai3vFNw9KISSK6nyloE
         K68dxRlshVDzBXjMZsx5WnsWV+o0pb5UM5ws2I96mVGgRYyx6Cn0OhQDxLnZ6Jiwae4h
         onDo9upMuGzHe9YRfeov6tClEQqB6DKl2UREyolAJ5NkVW+FkAbnQWkMrCxh3GGxVF3F
         E+SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ut4Rc3KN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc34-20020a05620a842200b00705bb8e5cfdsi6558403qkn.329.2023.01.19.03.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ut4Rc3KN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pISmf-0001ic-4j; Thu, 19 Jan 2023 06:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISme-0001iK-Bt
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:08:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISmc-0000Hy-JK
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674126517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJyY5SyRPd05rQpITcjmKdkYdCswBH9bA+C1ckXwwII=;
 b=Ut4Rc3KNBuTafGVUbcokp9puQaiVA2F+THTvSRCmF8asY5oBcseg9w6/079eKKKjpAA4Yd
 a8AYohkOPwLSReIWr5x5AxM43hY3ArqzIxCMjFnn9e/UpUzp9bk+yYgGBlfD+NBGmlF6nk
 7LqY8dDLcTU8leaOdCxb2NDJKZYCpDs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-P91GyVRpOBmtlRCCq77Onw-1; Thu, 19 Jan 2023 06:08:36 -0500
X-MC-Unique: P91GyVRpOBmtlRCCq77Onw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k18-20020adfb352000000b002bdd0a7a2b5so297534wrd.0
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 03:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJyY5SyRPd05rQpITcjmKdkYdCswBH9bA+C1ckXwwII=;
 b=lzkeUj2v69hFStRWJpB6+IcmAOYDrTCH5OfnCcfT2At1+gHCW6+gcRAq8sDwjVzW4m
 JKHkpoikcRFqIop869aAR97MtoSnEIZI+QOWDapGjZNl3GOsmvy2ais9FGN+hc6XbWPr
 VdNOMN6QjvpdAuRJus7ZfJqnfY7K4lMmr2IW/2GfpFU3ssusGroUBYtXr6QgL3I8nHLt
 TTLJHsc2kVONHoJtHXyjKIZPNyoDwUlIZYM8hQ+ssmzdGBw7rO3moBg1Yk+Ert6DmVNP
 80Sxo75fInoXstlMhPuTzLnDH2Apmt2bvJS2HzQiOl3UvREfoZAiJ2SPHc2g4FcuuxSv
 vjEg==
X-Gm-Message-State: AFqh2kpMKSXUhRCpXZuM2VDRzL+Y9vqgFra9S7/ts88lccWIbQFroSWK
 JTB4cHkFXZOIw5q3O5g87MCOR4fLBJAftbzTmUxASIV3ij+/fwl7ZaXb5b/umB35MZWEUoDwmJL
 5qrNc70LbC7dr
X-Received: by 2002:a5d:6288:0:b0:2bd:bc57:3c5b with SMTP id
 k8-20020a5d6288000000b002bdbc573c5bmr8037352wru.33.1674126515400; 
 Thu, 19 Jan 2023 03:08:35 -0800 (PST)
X-Received: by 2002:a5d:6288:0:b0:2bd:bc57:3c5b with SMTP id
 k8-20020a5d6288000000b002bdbc573c5bmr8037336wru.33.1674126515177; 
 Thu, 19 Jan 2023 03:08:35 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b002a01e64f7a1sm10108993wrb.88.2023.01.19.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:08:34 -0800 (PST)
Date: Thu, 19 Jan 2023 11:08:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 5/8] tests/qtest/migration-test: Only use available
 accelerators
Message-ID: <Y8kksKspvrbgHB9f@work-vm>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-6-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230119100537.5114-6-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UFMrrQHKFnss

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> For example, avoid when TCG is disabled:
> 
>   $ make check-qtest-aarch64
>   ...
>   20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>   qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

With the ordering proviso of the previous patch,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 36e6074653..1e7f1ea162 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -45,6 +45,8 @@
>  
>  unsigned start_address;
>  unsigned end_address;
> +static bool has_tcg;
> +static bool has_kvm;
>  static bool uffd_feature_thread_id;
>  
>  /*
> @@ -604,9 +606,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      got_stop = false;
>  
>      cmd_common = g_string_new("");
> -    g_string_append(cmd_common, "-accel tcg ");
> -    g_string_append_printf(cmd_common, "-accel kvm%s ",
> -                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
> +    if (has_tcg) {
> +        g_string_append(cmd_common, "-accel tcg ");
> +    }
> +    if (has_kvm) {
> +        g_string_append_printf(cmd_common, "-accel kvm%s ",
> +                               args->use_dirty_ring
> +                               ? ",dirty-ring-size=4096" : "");
> +    }
>  
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -2458,12 +2465,14 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const bool has_kvm = qtest_has_accel("kvm");
>      const bool has_uffd = ufd_version_check();
>      const char *arch = qtest_get_arch();
>      g_autoptr(GError) err = NULL;
>      int ret;
>  
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +
>      g_test_init(&argc, &argv, NULL);
>  
>      /*
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

