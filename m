Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4198993eje;
        Fri, 14 Jul 2023 10:40:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEFjQL48pmzrRKTD9XaCPbyTPqln97QrIJmKdtLHvTBJeXRAps0BmV8PrcpINh6rGCZI3Gc
X-Received: by 2002:a05:622a:1749:b0:403:9a33:5f53 with SMTP id l9-20020a05622a174900b004039a335f53mr6044194qtk.38.1689356435959;
        Fri, 14 Jul 2023 10:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689356435; cv=none;
        d=google.com; s=arc-20160816;
        b=YD+EsW0aZboH5upEpx+qD6+fBSjY59ZDprCQO7Q80lBmLjMLJSrTRlkvtcX6MensUm
         OGcDjRSEB+dZ/zdt4/zwTq7jTEV1N6CL6KvQaRKUuthljpwAMONigAEIPTN6HUAIZv2C
         TtMn1r+7C7SPzDCU+AMIl6qRR3cd5TE+PeYIge4xbEisMgkyUvpQI7Eb3YC/A8t3sSw4
         TXTzoQJr1U9a3lCgycXC6JzO3vIos4ylay6NWHoWV52teO8HGL429H6n7st6Ft9hA1R0
         bPwbuhJXC4T/1OZUUsnnEIlDkw6Uisb+W4+ss9/ka6REVnFXx3L2429VQuIwqLgI2kRq
         oJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=xF42m5Oa0piHxy7vtBywwfW+3doxzQhUCOD+KsizpBY=;
        fh=OSQm0zoHdl2B/oZc3NUJSvBdhljCiNXYyKKt5CDaiEA=;
        b=rWUzGuFeVCM87hL6Xgncq+Mpy1TkG9OE7hf970bsnhRhZPj8+AbChYaElw4kd5gOWP
         w5h2aaPtNuqYA53L36ZG2+NdMQ9o4k/SpEtkUGZre9DRmWjj/A8M98nvjT4+/NaNQca/
         c6+wRfJELGbJJ4j1pHqdT/t/FvegtLfmgX9RmGMg6A302LCo0JsNFsBIpD7Q00QmInBU
         OMpB4WNW2SmcNnTDHRrpoVKVfr47s8RHfcXyZk42ZYt9hF9VxHgeJDilbvuWvU2Hmtj3
         U7mstOY/EBuXeKAyXEyfEKd1rgW/SFO9U1xN+tlxw83Nc6yClxGzXhtyQVl+l6eqnAsE
         toow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac85e0f000000b003fddf085672si4892320qtx.165.2023.07.14.10.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 10:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKMmF-0003T6-M5; Fri, 14 Jul 2023 13:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKMm8-0003RY-J8; Fri, 14 Jul 2023 13:40:16 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKMm6-0000aq-Bt; Fri, 14 Jul 2023 13:40:15 -0400
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6687446eaccso2100535b3a.3; 
 Fri, 14 Jul 2023 10:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356403; x=1691948403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xF42m5Oa0piHxy7vtBywwfW+3doxzQhUCOD+KsizpBY=;
 b=DO/RCMYODZ/qIdR0JqRt5HCRNUX+vLk6q7Xm9Psgt14AiEsVKeaRju/5yXDTmHjgwj
 35Bz5e2ZkNq0eFTqGAjOrGcn96jRDj+JYHQssqvdCD0lG8dK6xj125kSwDI3VhB1K3O6
 z70oOJhTS5sJXfujEDcsF0guynkGbQqpGBRqpGY0d5V21U1Dna1d8U5UqatQqgAb6jPq
 ODhhA6gmrdaIbtoGcUsvxo7VxMx9D5CCdsUwZ2S11E2J9GI1TQAWoUyrX+3KaQZhuHM2
 2tkUy4q8THSb71eggMSG73AnvS2Z8lz2Any/QR7V98GmMaT6AKmZtySgLS+AM6djXAAW
 IlcQ==
X-Gm-Message-State: ABy/qLZ4mk5j5/mM4pzP9RDJJUSJOcKISMaHr67P59/LCiPT9aCcezJV
 YIlIONHgzeWdWbbAq4+pb+t8M7WU/2J9SA==
X-Received: by 2002:a05:6a20:549d:b0:127:5f72:e4dd with SMTP id
 i29-20020a056a20549d00b001275f72e4ddmr6589994pzk.44.1689356403122; 
 Fri, 14 Jul 2023 10:40:03 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com.
 [209.85.210.173]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa78046000000b0066a36d7ce9bsm7701323pfm.171.2023.07.14.10.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 10:40:02 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6687446eaccso2100506b3a.3; 
 Fri, 14 Jul 2023 10:40:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a12:b0:11c:fc27:cda4 with SMTP id
 p18-20020a056a206a1200b0011cfc27cda4mr5650897pzk.11.1689356402576; Fri, 14
 Jul 2023 10:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-10-j@getutm.app>
 <d3d3d9d0-fb88-9500-34d9-9780f9c2644f@linux.ibm.com>
 <CA+E+eSDinJuo8xyZTzfqKXr=rf+fyjkvOLVEqam0eapehQ1OYA@mail.gmail.com>
 <1a394fc6-4a64-5e00-5631-eb5a6aa4ce59@linux.ibm.com>
In-Reply-To: <1a394fc6-4a64-5e00-5631-eb5a6aa4ce59@linux.ibm.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 14 Jul 2023 10:39:51 -0700
X-Gmail-Original-Message-ID: <CA+E+eSCbPXZWk2zst+AunRpL74DOEB437mZqMhpWQ0K+=dvf8A@mail.gmail.com>
Message-ID: <CA+E+eSCbPXZWk2zst+AunRpL74DOEB437mZqMhpWQ0K+=dvf8A@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] tpm_tis_sysbus: move DSDT AML generation to
 device
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Song Gao <gaosong@loongson.cn>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 "open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.171; envelope-from=osy86dev@gmail.com;
 helo=mail-pf1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: vN3ThAKR6jWo

On Fri, Jul 14, 2023 at 10:37=E2=80=AFAM Stefan Berger <stefanb@linux.ibm.c=
om> wrote:
>
>
>
> On 7/14/23 13:29, Joelle van Dyne wrote:
> > On Fri, Jul 14, 2023 at 9:19=E2=80=AFAM Stefan Berger <stefanb@linux.ib=
m.com> wrote:
> >>
> >>
> >>
> >>
> >> I don't know whether we would want multiple devices. tpm_find() usage =
is certainly not prepared for multiple devices.
> > Sorry, "multiple TPM interfaces" here does not mean "at the same
> > time". Will clarify the description.
> >
> >>
> >>
> >> Good for the consolidation.
> >>
> >>
> >> Does moving the TIS to a different address help on aarch64?
> > That was the first thing we tried and no it doesn't help.
>
> I would remove it if we don't have a known alternative address that makes=
 it work. If we do, I think we should document it in tpm.rst.
"It" is referring to tpm-tis-device? Note that it does work fine with Linux=
 VMs.

>
>
> >>
> >> Can the size really be an option? I don't see it useful and if one gav=
e the wrong size it may break things.
> > It was added for consistency (otherwise we have to determine the size
> > by looking at the interface everywhere). Also, it is possible for the
> > size to be larger than the constant. For example, Apple Silicon uses
> > 16KiB page sizes and we may decide to force the device to be 16KiB
> > aligned (not sure if this is needed yet while we still track down why
> > the dual mapping was not working). In that case, we would need to
> > inform the OS of the true region size to prevent any overlap issues.
> > Both baseaddr and size should be provided only by the plug handler in
> > the virt machine, otherwise things may break even if we get rid of
> > size and have just an incorrect baseaddr.
> >
> >>
> >>
> >>
