Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp635857njc;
        Tue, 25 Jun 2024 03:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCXBqn9CtXpd6pRtoJEf9stuaHMobRMhyXSr5He8RfJUMQfHkoyzt4rgJoSAxjYz3uXTLQXYHSj5S5ksmJH7ow1RdKnbSt
X-Google-Smtp-Source: AGHT+IHv6zvDy2t/kReJSIT3H9fyspiGQBbpPs/PoRAD8/g/ept3b3KawFOfKrWqhvnejnCyhKv/
X-Received: by 2002:a05:6122:c96:b0:4de:847a:3647 with SMTP id 71dfb90a1353d-4ef6d89193dmr5616206e0c.11.1719312541666;
        Tue, 25 Jun 2024 03:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719312541; cv=none;
        d=google.com; s=arc-20160816;
        b=Vi2J71fJAMDog0+tHchbtJ1Y+/8t/jkrkhxWMcZ4LQasOJYTjGcMe3cSc83pJv5l3R
         QXxBbElkkCprvsM73Kx8CSYc6MrBeE9591sY6M3A/B1Z2bVTZpO3mIQ6Mcb5dG2coWrV
         x70esOinSjNfr8b5gMhSjvvUot/S3zrS4rAWG3RPfVl2HXCnZCpi4//My5mo/wKKjAQ6
         RneqC39sY7a/UHwSxgCwnCmynWUyv6HY0btPHxCooqmTt14Xatji+ADMbCZNKa+egcAQ
         n2IIGotm3HFNP4sXQR1cJVwa+HQdRaQtYc/HBtXH3pVPqfTTNpCTiHXtkc+slzhI4DXV
         37vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=9mQ99lHkIq3DfHEjy/RgutHBBcsK/k6F3d8XvkKQD8g=;
        fh=jPOpqQ4KaOJWV9sHwEVnD25RAD3kWQwndq4MI5v3mZ4=;
        b=Dq3YQxa4immdPLO/XzAGedYmUE1NvCZD8F1S+4Bam4FkFInzbPbAXOvQmmX5upHiOZ
         EqzOUO1SZ0sl+anULoq3YkbONgcglWG+j6PPREKTGrw76Xn4p8sSsLUXAb3SreHphJvR
         JFKAHOzPe5UIcZNLQ1HDqs7e0ulILh6CVMbd3GoZqOHSbiMm3EXX3LaFIgpMBi/cFZsU
         30OCSCBkIs1iEEKeU0s11SOPr0Tdiw6RuBcho9l06VoWuu8b3LczbmJLQtmdN7CD0cF1
         gFiSOScE/FRue7Ag+a7D1bpnoPPJpT2SfZCfqAwprjrNeFEyqbFE1rP12iLLqW9BIxVF
         6ogQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FziLr/EQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecf5f20si97446416d6.63.2024.06.25.03.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 03:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FziLr/EQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM3is-0004d4-7e; Tue, 25 Jun 2024 06:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3iq-0004cV-KT
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM3io-0005rO-U7
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 06:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719312501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mQ99lHkIq3DfHEjy/RgutHBBcsK/k6F3d8XvkKQD8g=;
 b=FziLr/EQnPSIIW20j8tnG1cja7C34XY1jA6CtpLgL8NMvrMOwPTU5xjQdmsNsgwAmLdQGe
 OL9gQiV0hJacc7u+8s6OkZnW5E0UoKJ20bLoFiLDhVlZRW63wTNivn+93UJJHdtiTeKEcg
 yAu5U8e5uafSiRiQZx9BdpPGkNwr3Fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-4nokyUFLM9iQRglDpTklfQ-1; Tue, 25 Jun 2024 06:48:20 -0400
X-MC-Unique: 4nokyUFLM9iQRglDpTklfQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-364be6c2468so2457808f8f.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 03:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719312499; x=1719917299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mQ99lHkIq3DfHEjy/RgutHBBcsK/k6F3d8XvkKQD8g=;
 b=EU3LY3A9wkHpUhwtVZ4ahunomX88oIm8dV0jSbwK0xxpBeYWSIOo9lp4qUk0l+hjZn
 o8eJSMLP+/dCryQ//PhGN9o1iiC8xS7fdlefQqveQgWCHemQsmhHN1X8AaFxiqmJtEPh
 RdLm2QvF2nABvn9X6GJW2rKwuNmxKh1q5wu1QjXrE8So7J9GQ5WajyXeOoc+a3+w11gv
 EmngLH2OZ3B3ODohjeHlnWQckg9bArKIartVREIOVXSXliiaoH/tCMdyOBsxK87JPeru
 EsfQfBsPsaEFYCBOqtqm9lAAHqm78JwtRnoBZ3K3dyAKlu9JJdoBLXGPFnbMsUzGUjqJ
 lXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuYNtDSQznnw+JO8HvYfYAXok8od/JqhJuwtHGwenf0GN5Qk2ITi3rANjAz2hK903AFC+2SyyyfA4Uet9AHcgxdGLZ
X-Gm-Message-State: AOJu0YxBrHYelKZ0s+cqmZW8PKoRcOaasH+0Bi/CQtcCm24LOpBwdq/F
 Kh6tqYdyHDK8EO1d4gpHfrDFu33bgbjlrCVKixrV2FCYcfdNt81rKgw1PL48B8uDnJ/fLxe6pdc
 tYpxK1YVh4n5ZlNBUrWX6gdtK2GnPGZ/IZgUegRovnzBU52SGpw==
X-Received: by 2002:a5d:5f49:0:b0:366:f713:bf05 with SMTP id
 ffacd0b85a97d-366f713c0f0mr3926627f8f.64.1719312499132; 
 Tue, 25 Jun 2024 03:48:19 -0700 (PDT)
X-Received: by 2002:a5d:5f49:0:b0:366:f713:bf05 with SMTP id
 ffacd0b85a97d-366f713c0f0mr3926602f8f.64.1719312498653; 
 Tue, 25 Jun 2024 03:48:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9c1d1sm12589567f8f.51.2024.06.25.03.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:48:18 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:48:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v3 05/15] tests/qtest/bios-tables-test.c: Add support
 for arch in path
Message-ID: <20240625124816.48183def@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240621115906.1049832-6-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-6-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: W7RtLObcD1nf

On Fri, 21 Jun 2024 17:28:56 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Since machine name can be common for multiple architectures (ex: virt),
> add "arch" in the path to search for expected AML files. Since the AML
> files are still under old path, add support for searching with and
> without arch in the path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c4a4d1c7bf..29c52952f4 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -78,6 +78,7 @@
>  typedef struct {
>      bool tcg_only;
>      const char *machine;
> +    const char *arch;
>      const char *machine_param;
>      const char *variant;
>      const char *uefi_fl1;
> @@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
>          g_assert(exp_sdt->aml);
>  
>          if (rebuild) {
> -            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
> +                                       data->arch, data->machine,
>                                         sdt->aml, ext);
> +
> +            /*
> +             * To keep test cases not failing before the DATA files are moved to
> +             * ${arch}/${machine} folder, add this check as well.
> +             */
> +            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
> +                                           data->machine, sdt->aml, ext);
> +            }
> +
>              if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
>                  sdt->aml_len == exp_sdt->aml_len &&
>                  !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
> @@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
>          memset(&exp_sdt, 0, sizeof(exp_sdt));
>  
>  try_again:
> -        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> -                                   sdt->aml, ext);
> +        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->arch,
> +                                   data->machine, sdt->aml, ext);
> +        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
> +                                       sdt->aml, ext);
> +        }
> +
>          if (verbosity_level >= 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
>          }

