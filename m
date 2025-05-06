Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2798478njj;
        Mon, 5 May 2025 17:12:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5csb3tdbO3Hy2+QoEn9QKMVtzMY6VxHip0Bx3lMKkZ7IK3bJittVotD1NXyK62+aO8AljBLFR8PZ+RA==@linaro.org
X-Google-Smtp-Source: AGHT+IFL3Pfb8xMVtR0N1rW95yjpEGixMgSDF1QDC0S31ZzKn3J1XHA8o+tb1yFgDbsWXt7IhlVD
X-Received: by 2002:a05:622a:5513:b0:48b:28e1:fb79 with SMTP id d75a77b69052e-490df959503mr29338931cf.0.1746490326718;
        Mon, 05 May 2025 17:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746490326; cv=none;
        d=google.com; s=arc-20240605;
        b=NGgJOIGtuIiSbSIlTNdJN6w2wtWxa8nUFWI83ZyYpwFqNeZJ4EXmx2pmBGVQMV4XUq
         RNmSv1ZGLu9eQO2Sl5PmQ4OTuSlxIl5NJYjQGKHLYMgIGk6JvjN7xU+JAO17Sv0whE+v
         ETeqr/I7U4H/ktVas0CXOCoKFYakUrp0KyL9G8beI8Y+07gZ5914ynG0cGc4lbavMzUk
         CBscy7xgLKkWM0+sR/HKmJ3CwnyzCrvL/su1b1BOGsipzteHtm43Q0RprUy71a+9Qz+d
         heMVVFLcbaG/+kFgBxv1bVYRDD+PcfUNUmbQRnQ4Ylsx4mBgBArKviCLRzRvli5KN0a3
         iHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pPYohP+2+Ojai2hA+Ri6L4jLq96SA19k0mKSSyeJVtU=;
        fh=m26qInox3F3+jLwBTXAd6k39Lc1yq5OhtBZ6xWGXUkY=;
        b=aftyxg6Yx3KzuahPutLQ7HxKEhEfanYOValFRXCdYa5y53Q3NOe3be+bEvQIftYeid
         UW1GZk8Nv8lukGCCaT9KmlpUX9H9J0/8f4oVhPKMQB8Pw4uEVmO3j3GJ3jNHSyQHT5Q7
         NS+g/vuIX2CSPcqxrh3pShlHU7LLsr/G4V9oSwxzYZJh2WOOXNiNpb1/57s6PFLCePZB
         jfsUGQhFREC7t4DuqSMVQrMdDqJcDFGhxMsE/9rx/e6uC17EUcKcbtoiAtNurhqQ843A
         KFlzIMHrPpuld7E1Ox1CFGJMoOXc5P2ydgTynYVpep+tU+x30wog7m9+0coYZby1v+Ni
         fwyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvYSN+y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48f66b655a1si31902891cf.481.2025.05.05.17.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 17:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvYSN+y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC5uS-0004cg-IB; Mon, 05 May 2025 20:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5uP-0004bt-A3
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5uN-00009X-O7
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso5229481b3a.0
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746490298; x=1747095098; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pPYohP+2+Ojai2hA+Ri6L4jLq96SA19k0mKSSyeJVtU=;
 b=xvYSN+y4DXwtGrPQg9Y7/p9y4LzSR4XV3DFL3EX3VBFdwaHWupxkpc6cYpaLAtyuz4
 iEzA7NrjX728PpVudcmwsaf8y0DjsBoPWyfqQUoO58ZgdwiTY9c+B7RiiosOzLScckjW
 TyUTEbZV+73erzAvSbeNb1VKcMF7S3uFJXMkxW0liLCgowPOGzKHLZ66ckm5kdV29Spu
 wiwj4CuShYWctA/4uGZtx5lsUgGIzmfpodPLk7ai9dX23e2CS5E57Qit8HyFhrekCoC/
 yq4IovgvZI8ZJOTnqiB4remXT2cX1uWSh6X3JNHhwWZmrMoaHZqvt10rDJdn7H8r2IsS
 zUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490298; x=1747095098;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPYohP+2+Ojai2hA+Ri6L4jLq96SA19k0mKSSyeJVtU=;
 b=JuwpKNeQHb24KOtEVgHtW3JmdE3JHsghB5+Zo4fDzQrrgIpvNFnHAsJAt2M450xjYA
 glf4rnus2tBtB9FHKPkxkUDUPZbNJa+yjxrghb633odY7yvslfSmBBcPvd9FIj0zalHc
 DPVpFGwd/9RtWap1ly8bQt7so6QlGiDIIa1O7FaW+IesOleMJllSe7MXHE0xgWHXpyGh
 77VoIX+oS3xlmJ8CQ55q1/eUyOhW+T69Kkbk3rVBXG0woQ+JGB+GDCy3SLoZj5lq1VJ9
 CaGsYxxlv/VpQSXSVzSZPrWQUnFN81EABGNXd9uhyvG8rHyaoZKqse8aEdSZF/HC0bzn
 z09w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVroZmXD0Obbyd9Rci30daunZgRFLCDrtiX7fg8fQ9PAK0pQmvX49MN2hbLUJeXi+WBSQCbUnYMEA==@nongnu.org
X-Gm-Message-State: AOJu0YyFvHBgW4xjaLHaxtKP3Ep0B5fvSiUlLupMcZMKX2EWS/+/t69T
 y9JvQWB9udrpBkWTmur8XSVSpb5ZkOMqwg/hLdSEzKLDvv3GScQVgsMyt2momZA=
X-Gm-Gg: ASbGncuHW/NzUBU6RcNgsmIE3k4N+TIUPNKOyj0zbwLUfD/djJ4AtAFtRLEMBB1VaeE
 09odRVDdnxhYJCpO3LHUJgMj+KyvjWf0+kJQLTr+kNmLrBzUigsR8I/CWVdXhJuXPZkdRaQ1LRD
 QSRQXqo8mVGONbtNhPJGULD0bp8ARgF274xkLbK5mtf4JfeoNN9b3rKN/if4wmW8/2d2dk/0H4V
 K15Nl9A0RIuC67A8BGJUbQmKjIIWK3uqQo+iub0XpoDxZSJRO/+KUT2aDkrTCUfGPJY3BqeloGz
 6D3jzPhdDau6gE/+VZkb2wLDpm45JLZg6/o52syS3IMDI0uW02YaqI8uNIAuIPKOQV0ZjriZuV4
 8ZLXMA5cTHmIclTsVpDo=
X-Received: by 2002:a05:6a00:8216:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-74090f17b97mr1417717b3a.9.1746490297959; 
 Mon, 05 May 2025 17:11:37 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405909c491sm7518535b3a.159.2025.05.05.17.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:11:37 -0700 (PDT)
Message-ID: <d5451229-4369-4c85-a499-b9a03db772c2@linaro.org>
Date: Mon, 5 May 2025 21:11:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [RFC 03/24] hw/i386/acpi-build: Fix
 build_append_notfication_callback typo
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-4-eric.auger@redhat.com>
Content-Language: en-US
In-Reply-To: <20250428102628.378046-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: y3VRQaVK/lkg

Hi Eric,

On 4/28/25 07:25, Eric Auger wrote:
> Rename build_append_notfication_callback into
> build_append_notification_callback
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/i386/acpi-build.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 3fffa4a332..85c8a8566b 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -589,8 +589,8 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>       }
>   }
>   
> -static bool build_append_notfication_callback(Aml *parent_scope,
> -                                              const PCIBus *bus)
> +static bool build_append_notification_callback(Aml *parent_scope,
> +                                               const PCIBus *bus)
>   {
>       Aml *method;
>       PCIBus *sec;
> @@ -604,7 +604,7 @@ static bool build_append_notfication_callback(Aml *parent_scope,
>               continue;
>           }
>           nr_notifiers = nr_notifiers +
> -                       build_append_notfication_callback(br_scope, sec);
> +                       build_append_notification_callback(br_scope, sec);
>           /*
>            * add new child scope to parent
>            * and keep track of bus that have PCNT,
> @@ -1773,7 +1773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>           PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
>   
>           scope = aml_scope("\\_SB.PCI0");
> -        has_pcnt = build_append_notfication_callback(scope, b);
> +        has_pcnt = build_append_notification_callback(scope, b);
>           if (has_pcnt) {
>               aml_append(dsdt, scope);
>           }

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
