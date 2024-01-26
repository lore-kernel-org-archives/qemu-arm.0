Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp966440ejc;
        Fri, 26 Jan 2024 08:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHonRWkhXW6p0O95wTaHH86ob4DLugdn7DWIYtm1j19Ub42iUYktvrOph0EeVkk6Dk7CRo0
X-Received: by 2002:a05:620a:4ce:b0:783:6601:a80d with SMTP id 14-20020a05620a04ce00b007836601a80dmr1823499qks.9.1706284960646;
        Fri, 26 Jan 2024 08:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706284960; cv=none;
        d=google.com; s=arc-20160816;
        b=gvdWsU9HaGDec87ECers3iwBedqzxaD+rgyodVB8H1pTVOmRRqwzwszU3fBBJGmhje
         nXw041gGjGJYGJApE+9g6bIikzhuFnQSRvL108SA0kCOR/0Kj3xo64Elp0Gw93V30uCl
         +szNKkP6RExZ68Vz+56fNkxAAsTMcX0JwZ2WsmQl/FOAPJfgBjt4KmvKjoDqq86wDEDM
         oNQglj7rxXf2NchYR9MjeVfWcj66yPkC+bhdevtqciu3axIRVfgkHKjlO5kFpqWRcEp/
         BmrvDcfEokGUmFHFtUNZkaCJFdU96q7ZsBsMbaH6dWAWom9c2SpOyqLeeewArrBiBPxV
         r4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=K0i04O7174d0OKv11gEirJYlyXb4UP+O2CnLeSTT3do=;
        fh=RIVWBOSs2OZlP7XXIPkGQw38oz8oDq1OvCeujjh55qg=;
        b=W6xAGSEFRAfMcEGimDWsBPQPLzbjH0TbDx0D6I4es0PYRogAY8oQGlb1cS6xzJqNcj
         0mKM4dm9bnV72f6i3332L+iFIJBw6JZrgLSWiry4I7nKI53drNhNSbLiyWTSxsyhb4H/
         rvP5VDoXGjGj4YtpBfOaojJwE0OvrGe+PURrpmNxmK70hVRb1VWNnqlcTJPSovIUydhY
         ekXc3i/YdxV6dxeU+dteNPm6i1O99IKBIERUfhSGyw7WWEX3RADPSHkEW+xJch6doiXi
         r69HsjlHLyskLOV+2RGulEsabkk+BGQ78hluMuedXeKJ65kvkCZTMQ4s+bFVNPyLUYUB
         rVKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JK+qNFzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a05620a108d00b00781e1787c1csi1559760qkk.507.2024.01.26.08.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 08:02:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JK+qNFzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTOep-0000GN-Jw; Fri, 26 Jan 2024 11:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTOen-0000F1-9q
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 11:02:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTOek-0005gU-Dx
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 11:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706284933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K0i04O7174d0OKv11gEirJYlyXb4UP+O2CnLeSTT3do=;
 b=JK+qNFzpT/Il6HgHW3BJXJ/qTuiqKr8S47zdqnOHhLZEwfo4cKi0XC79Z3zWVGerK3vWnq
 ZCjUELHph4hNwICKhm6fI8RyUkw36OEeo55fC+gBhVcxUKA0qDcFxvj7dUiN44HO5UrMht
 FLYuCPX7PoQBRBJt5xgwW20caoxlt/Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-yvYAOk1-PiW5uOfONjWVig-1; Fri, 26 Jan 2024 11:02:08 -0500
X-MC-Unique: yvYAOk1-PiW5uOfONjWVig-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-429841cf378so11839821cf.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 08:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706284928; x=1706889728;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0i04O7174d0OKv11gEirJYlyXb4UP+O2CnLeSTT3do=;
 b=DKQjLKC9sOt+kAG2+jRbhkSPXSdeuOMY1UVUlevOcVf+Uv01Cja12DyqkLSVWvUHWD
 MaTDSbzZ3EatB1RVF7k9JnpFVgDK+ww0VV2b7ZtvuiCNDkWRBXcj0IDRL8NjZeJpAIsV
 c9xWvc5KaNgNQF6o5+TgBmZSSjMOgp77aeqfL76mM34sLhDSRGa57Zv62J4zNkb6nlGE
 bO5jXtWkdZhfT2q2UhwUK8af0zYuB65RWlcZN/+spYgG5o5j/raq436gyOvFIQ8bd5HB
 yQrXQpMGAQ2zDiV4yqxGJVw0Q2t1RqoMyQmai/PWaGmVR7FKOiSm5AmJ3cjxLDBvxViV
 7VyQ==
X-Gm-Message-State: AOJu0YwNvjSJpxYfaUuYGfSsjyHEQWXLvSCtVFwpu3lmEU80jfpxHrP+
 f6DSgCUUaphN7bnlvBnFQ+4ooUczxiQBEUMAfU8fYDeGv75FdheQ0vXGOjHwRGEcLUQuLJsSNtY
 k+kN4tFzHCf+AKMKk+Rv/njIlWzLf9AQlaL+TlDVpyqBqtkk0bA==
X-Received: by 2002:a05:622a:2485:b0:42a:3bcd:d1ba with SMTP id
 cn5-20020a05622a248500b0042a3bcdd1bamr86529qtb.33.1706284927988; 
 Fri, 26 Jan 2024 08:02:07 -0800 (PST)
X-Received: by 2002:a05:622a:2485:b0:42a:3bcd:d1ba with SMTP id
 cn5-20020a05622a248500b0042a3bcdd1bamr86371qtb.33.1706284926215; 
 Fri, 26 Jan 2024 08:02:06 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 ie7-20020a05622a698700b00427fabefe3bsm616431qtb.52.2024.01.26.08.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 08:02:05 -0800 (PST)
Message-ID: <befd1aaf-91af-465e-888f-1ed8db6282dc@redhat.com>
Date: Fri, 26 Jan 2024 17:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 43/46] net: remove qemu_check_nic_model()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-44-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-44-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TcWbf6Kei53Y

On 08/01/2024 21.27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>

Please add a short patch description à la "All callers have been converted 
in the previous patches, so this is not required anymore".

With that:
Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/net/net.h |  1 -
>   net/net.c         | 13 -------------
>   2 files changed, 14 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index 31e63d1f0d..1be8b40074 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -204,7 +204,6 @@ int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>   void qemu_macaddr_default_if_unset(MACAddr *macaddr);
>   int qemu_show_nic_models(const char *arg, const char *const *models);
> -void qemu_check_nic_model(NICInfo *nd, const char *model);
>   int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                           const char *default_model);
>   NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> diff --git a/net/net.c b/net/net.c
> index 4651b3f443..ffd4b42d5a 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -992,19 +992,6 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
>       return 1;
>   }
>   
> -void qemu_check_nic_model(NICInfo *nd, const char *model)
> -{
> -    const char *models[2];
> -
> -    models[0] = model;
> -    models[1] = NULL;
> -
> -    if (qemu_show_nic_models(nd->model, models))
> -        exit(0);
> -    if (qemu_find_nic_model(nd, models, model) < 0)
> -        exit(1);
> -}
> -
>   int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                           const char *default_model)
>   {

