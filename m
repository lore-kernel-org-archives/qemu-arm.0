Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1148232ejb;
        Fri, 20 Oct 2023 04:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1R03ix/JwtlQ1dRuTtiLE/D1KzV0eqDFn2BkZmsR3wupSrXekvaxgM5QskYzS01kHSn1S
X-Received: by 2002:a05:620a:19a4:b0:775:ed1e:2b14 with SMTP id bm36-20020a05620a19a400b00775ed1e2b14mr1356419qkb.54.1697801512966;
        Fri, 20 Oct 2023 04:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697801512; cv=none;
        d=google.com; s=arc-20160816;
        b=VyVqSl0+5HbriWwCluJXkVOcSI4qx5Nhyt9s2tIuZOZeubBGKDInbL1DLFt+t6KOnw
         v4S+vC0B0eyeuqlp+sL+8kpfjvYUsI5I6v9o0fWDBL/74fkvaQAjcgg7MNUigjG+AN2T
         yt6EAqyktoQ8bJuTFS8v4CtcqpRWzrIux5OUhJb0hgqoSLDeGUNVpwIXinJcRzT4gfWP
         H8YCSczPhoxBAdadyGqKFAqx2rfCfBXpq/cXTWhE6uZRwjHwHX64CSzQfz4wklXTpzpx
         Y2TpaWoJD3V0n1uSKDPxdlBcTsUuInjrWtnBkPo05io9dOBAyZXqh7Lq/1xuf9/1clYm
         4fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x9PiLiKWZP0A15mhDUrEz3k+BPD7Zn+8gTlk+P9gEtg=;
        fh=D9Zy3Zo6Ngtij0ADD13U6lCyN9zlgWdxS2svbWoLGjE=;
        b=J226ScvTEBjI3+TJ1Q/v5u1KrOEcdWTg8MFLSHYitmakXwTA2OHAFEOamSv6PPNieU
         AZuCqpjrUciFP/HGI3V42kPSlpvDCXWMp8ItlZn1UO3gdSq5X0oCauvXOqFhiWzO6DNv
         x4xoy99xM9Z+cEr3BGIox2zeC7ttDmL+uwqA861X2Fq82S1T29U68m20Ateor1KyumGC
         tLt3TZ3uX0TBcegurPBmT4LftbQ0mQIfcLk24Dkcf/HH2PtYNkN4NtEGGdxLJ5fcdVDG
         VXgv+rnHVirvqgAXTUnD9rJSP9Dos89mKPdpCH4RTwg+oLYkZX39YW75w6wsjwpYVh/V
         8wfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0Mm2MeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20-20020a05620a24d400b0077894fa3885si1103305qkn.268.2023.10.20.04.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 04:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0Mm2MeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtniZ-0007zl-QP; Fri, 20 Oct 2023 07:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtniW-0007vI-2H
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:31:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtniT-0000P4-KN
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 07:30:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso10755755e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697801456; x=1698406256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9PiLiKWZP0A15mhDUrEz3k+BPD7Zn+8gTlk+P9gEtg=;
 b=A0Mm2MeE05OnxgW26pmiA8460GVfDK4ieEojg46x8XIyV7txPAh4t5QUNTfhurgdbr
 0f6b045MwYyh+JpOoOcCId2Cs2UBa2zV5HPo8TeXFUekT0tMc2/9TDsgVNginH4/vWMT
 TeP1geisyNy+t7bn8p5WrlIKabnMcbhA6D9vTrOyYnKyh63h8zP5WxNG9KoFD4ThAGAS
 B2sEDDFvULiT9I37E71S5CXrSABpng/DZhEkXR0kQd2a2eKGuU1mBG3OXP2f8/vCnzJ0
 F8dBsqCr7VGn0vYxDtLd3sga+pEci6yJ2XeiXR/Mva1ihQc+kUNYAQRLJyR+TdqQdR9D
 qs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697801456; x=1698406256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9PiLiKWZP0A15mhDUrEz3k+BPD7Zn+8gTlk+P9gEtg=;
 b=LNqWByumsPTRkgrQbZiwYngvu6071MGI7OmAg4Ib9WwKOsO3e0mjha29BMi8kqMp21
 MnaU9I9tudVZ+J9HCOJU2CyMuo6iSlCuCCNxzWKeFiL8rYwQHTTyZQnlCCxrAVgO1bIC
 pnyyQ79MorRfhBLC87qnLxOS6uCD3IEK2q5jVKjrYayU+Vo2xdll/Sr0TdeppmLq0uFe
 0OO5qZbyGtiKChmr+kBnTXz+zPCvhGSYHLjLh7OzJ/Wjy0jBymEoYuLAHukeqZ2hL7SU
 nZtK/Zn6erNm2ikD16sdacTDpA7AXGQAC1fa1M0yykJAIZt4LDLs+U8xc/xWwMfsaCXM
 ZB0Q==
X-Gm-Message-State: AOJu0YwN0mvz6v7fMKToBGFMBQ61Hm9r8/n70PTKAbB6WfiypuPfZk0u
 o0pYedUpGgszumFAN2YQrqvOgg==
X-Received: by 2002:adf:eb87:0:b0:32d:dd68:e83 with SMTP id
 t7-20020adfeb87000000b0032ddd680e83mr3922573wrn.21.1697801455790; 
 Fri, 20 Oct 2023 04:30:55 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 ay10-20020a05600c1e0a00b00405442edc69sm4133104wmb.14.2023.10.20.04.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:30:55 -0700 (PDT)
Message-ID: <94280b39-a331-003d-f227-38c3e1b94434@linaro.org>
Date: Fri, 20 Oct 2023 13:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <ZTIVQfTmkK05fln9@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZTIVQfTmkK05fln9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: BmHYOuhcogUJ

Hi Zhao,

On 20/10/23 07:50, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Oct 13, 2023 at 04:00:59PM +0200, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 13 Oct 2023 16:00:59 +0200
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
>> X-Mailer: git-send-email 2.41.0
>>
>> Since v1:
>> - Added R-b tags
>> - Addressed Richard comments
>> - Postponed OBJECT_DECLARE_CPU_TYPE() changes
>>
>> A heterogeneous machine must be able to instantiate CPUs
>> from different architectures.
> 
> Does this mean the different ISA cores in heterogeneous machine?

Yes. Currently the ARM target already allows you to do that
(multiple ISA cores within the same architecture), see the
xlnx-zcu102 and fby35 machines.

> And is this case for TCG?

This is *only* for TCG. I expect hardware accel + TCG to be
theoretically possible, but no interest has been shown for
it. Anyhow this requires heterogeneous TCG as a first step.

>> In order to do that, the
>> common hw/ code has to access to the QOM CPU definitions
>> from various architecture.
> 
> About this kind of heterogeneous machine with multiple CPUs, is there
> any initial configuration command line example?

I'm prototyping in plain C but our plan is to start with a
QMP prototype. Command line configuration is not an option,
we decided to ignore it. I'll describe that better in a RFC
document I should post soon.

Regards,

Phil.

> I'm not sure how to configure this case...The main unsure thing is
> whether the configuration is based on the granularity of the CPU
> (by "-cpu") or the granularity of the core device (by "-device
> xxx-core").
> 
> -Zhao


