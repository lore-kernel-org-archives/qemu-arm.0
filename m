Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp961375ejk;
        Tue, 30 Jan 2024 09:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8SRwt39A9DxrUv+70VJgZIOUkmuZc9uAAXQqy8VIIXu6bx571Ne/mCb1frWnC8YSwt4Ot
X-Received: by 2002:a05:6122:e6b:b0:4b7:3c54:357e with SMTP id bj43-20020a0561220e6b00b004b73c54357emr922271vkb.1.1706634709344;
        Tue, 30 Jan 2024 09:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706634709; cv=none;
        d=google.com; s=arc-20160816;
        b=MlufOTTTio/7oMELTlNWVC15/PNgCer6jKqUtysE8YkDoO76cQJp/CEwXXLkk7zKXC
         w2uGH8uak++w0Np7b1PTs8QiNxlYaPKPFH0tSo0zDNXwjlBAq4H9DoqYJfQdNXEDi5ya
         Rb+1t7ay/pG3gart9K8BzRM4R29x/FA5SQljkiGdKBtzd++zXgzOJCAyBd8Lqi0nNjZM
         8Q3XyAWoK4o4oPcIvTNtsJkLB3RUBWJjAKTuFznLJJmIvozXQFNwPoOjv3+XGnnv/I4z
         8u2Stv9QbHM9LPUVdI89vpc5XdrQONg4/faLzLy+gVkKK+o7V6FvAMP650Oq/iY2ch5A
         cIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=+kzOBHm7GNoNaZFkMrt8k2W+/6HNS6eWcviTjYAg+To=;
        fh=cZcfwQooAypZMR8S+YDeIdQ645V1fWGYrDcAd2zT4cQ=;
        b=gvpe4hJb+4UyvnC2+nJmYI4Xc3uIvEfwoenyz647R67d4EVg1CstZNRXV5eNs+/rrh
         5Xxfa7EcaYhO6OYB1AER9c1UFZ/45zuaYRckKL0c5+KeVEx1D/065O8GF+gPfmVjiPtr
         6wjINlaOqFAz14di1MLOOwIxl/M0JZ6E6N0lWhTH0iNYAbiaqB6BeEFoMKOSyizSsxnD
         CAEdio/mieAtU/xdoejmcdC3GM9xedKj9QbZe1eVqbDF+gl10EDI0zugQeQJjgI5jsoa
         +bQAWDiuyjNLFsWvR1PjY9J9+WRPEA6rC+ws+TPNCp3KCf6YIhocoVHyL/7aRWKoQToB
         Z/GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jA6UMtYJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj40-20020a0561220e6800b004b72dc3a3e2si1210485vkb.210.2024.01.30.09.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jA6UMtYJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUrdx-00035m-OK; Tue, 30 Jan 2024 12:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdj-0002x7-LJ
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 12:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdi-0003WK-4M
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 12:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kzOBHm7GNoNaZFkMrt8k2W+/6HNS6eWcviTjYAg+To=;
 b=jA6UMtYJGLfX3B0RFKXJdAf2gxPQWqNMO7d8+o2Aw0xfIUxoC7rUNZEhklNAXwjSHcLyoe
 eF0GcrRkmfASC4wojOb/e8TMbzCe9k+YTO5UlUx1HehVrKvtvhMX14V+GvNbMoGUOyYCIg
 ZSzb1aX2RFk+kDPAUIrJ/mo5gKJVgFM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-HxGYDHUANOCb_ow15w15wA-1; Tue, 30 Jan 2024 12:11:10 -0500
X-MC-Unique: HxGYDHUANOCb_ow15w15wA-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6de331e3de2so9053b3a.0
 for <qemu-devel@nongnu.org>; Tue, 30 Jan 2024 09:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634669; x=1707239469;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kzOBHm7GNoNaZFkMrt8k2W+/6HNS6eWcviTjYAg+To=;
 b=xS4bdGHWV87w8Rx+hGAp3DQMlOhikEvLHqLIRRUkH4raMQHYRi0Mj/JT8/580stIdv
 W/g6IA8On2jGEFLgwMCwdQhIN7rWHza42XXa8sEjv6KK/ecMQrIkEioG+/R0CjWbns9W
 WgL4T+vxYQMEo9ZeEiCrUWSyK8ancocuk13MCY3rsXLXs5s17BVTYl5EGzgRGsvtVTV5
 g3MdH828C1medP6YzAidIz+yOUIT0nxCIH1kWKAVLysx0Elt5tRN1aRJmc6sr7f+sI0b
 b005gNbWlGhCqA5JPdUvHeIezE30a0MhoGRJVey2aPdIuoKwDEZ0c6DnTU/Y03YlR160
 9moA==
X-Gm-Message-State: AOJu0Yzfew6lXdvl0M46ZmJgrWBY9jAysS02BvNy9SskH8D5clzsovsZ
 RLBJvJMEmHsEzFGTlh3Syrimmt/qVIW4hobxETigsbT/Qknv5xHyCwokDh1BAvd15ObTqR3rEJK
 7X58xtfOUSSAU9FMS86NXMzB8+j72avUHnRYDnsUC20p+B9VEZihx
X-Received: by 2002:aa7:8ec2:0:b0:6da:ed17:bfa7 with SMTP id
 b2-20020aa78ec2000000b006daed17bfa7mr1874733pfr.6.1706634669482; 
 Tue, 30 Jan 2024 09:11:09 -0800 (PST)
X-Received: by 2002:aa7:8ec2:0:b0:6da:ed17:bfa7 with SMTP id
 b2-20020aa78ec2000000b006daed17bfa7mr1874717pfr.6.1706634669165; 
 Tue, 30 Jan 2024 09:11:09 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.11.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:08 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 1/3] hw/i386: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-2-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:40:54 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7AD93A16-E040-4223-9AD8-93D73D62F572@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-2-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4ns/ZV+pPbi8



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/i386/acpi-build.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index edc979379c03..e990b0ae927f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2697,7 +2697,7 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>                         " migration may not work",
>                         tables_blob->len, legacy_table_size);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         g_array_set_size(tables_blob, legacy_table_size);
>     } else {
> @@ -2709,7 +2709,7 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>                         " migration may not work",
>                         tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>     }
> --=20
> 2.43.0
>=20

