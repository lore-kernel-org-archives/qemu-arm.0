Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4700779lfb;
        Sun, 29 Nov 2020 18:52:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSMylQYAKtCDDVSaXNvjsO/ehky8hzrPpjhW7/t892ogRP83TpRipeDebouitvd8JNBIgN
X-Received: by 2002:a25:344a:: with SMTP id b71mr21343324yba.301.1606704739411;
        Sun, 29 Nov 2020 18:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606704739; cv=none;
        d=google.com; s=arc-20160816;
        b=NH0gbou/tfqmVmzBWryPbz/b+lfRvx87wWK3zKgyIxMizURapVu2ssXw9Fv18BFBtb
         sjYfwtgmkEkPD5YHVAF1gYd9hZoTwQPvtitQ+8T8tyI0PeGZi9tMI5bV53arCasQOXXq
         WHBzqMiodsiqBQJBSbT8SNbhm8Fdcoun89nCmXdiXiB5nOEXOj3u0On2eToXITS8se9I
         GCAfJRjbWLj1EHjWxleXbvmN/qIH75e6unhOEtHfaiqlygY58+OyddkKCA86d9hEX6gC
         H1TnWJBTdL/EOZkNBqerlDXLmwLzB6cLWqt+nk3yEFzsImM3raTSKhNZjQIU9mbw8Ssi
         vfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=OnUmN/LGUD71a1Nan2TxjsdoOvLTlsk61OZsWI1lOIk=;
        b=g99lK82yvhjePw8o1lU2uUGobqwsUaBrApbb9YbvCBtTkycYhmQqGQvjWR1byW5RAX
         2/23RqPfelqau8LonU/WaRVQp5OekLVmGdaX/JWwIblWWI0VWRjoX337hKne5zQIcHOz
         jumzMxAdumPC2yruvZBKhEjlcziIMQRUsuSIOtTkeW3ZVLXR8RZEx/iO0c9jM08IhlYu
         +EJrP+3+zSSEPOToWz/Vp+YGNTRVTkKSmI7Z5u4r/I7D7z7b0laOPXyNQh8+Yx3i6+ho
         5VnWI0Vz+cJAj10hdnNfHvSi9hPATeaKsvXEDN+nx7Nl4DtdhvmNqKM5JgGgKK14PdsN
         e9VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si16673023ybl.434.2020.11.29.18.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 18:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjZIY-0006fD-Np
	for alex.bennee@linaro.org; Sun, 29 Nov 2020 21:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZ7J-00082o-Gr; Sun, 29 Nov 2020 21:40:41 -0500
Received: from mail.csgraf.de ([188.138.100.120]:33918
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZ7H-0006JJ-Cp; Sun, 29 Nov 2020 21:40:41 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 2E83839001C1;
 Mon, 30 Nov 2020 03:40:33 +0100 (CET)
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <c3b7d74a-3a4c-d102-ba0f-0da436eec4d3@csgraf.de>
Date: Mon, 30 Nov 2020 03:40:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Zkmh33PEuQJ


On 27.11.20 17:47, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 16:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Having looked a bit more closely at some of the relevant target/arm
>> code, I think the best approach is going to be that in virt.c
>> we just check the PARange ID register field (probably via
>> a convenience function that does the conversion of that to
>> a nice number-of-bits return value; we might even have one
>> already).
> Ha, in fact we're already doing something quite close to this,
> though instead of saying "decide whether to use highmem based
> on the CPU's PA range" we go for "report error to user if PA
> range is insufficient" and let the user pick some command line
> options that disable highmem if they want:
>
>          if (aarch64 && vms->highmem) {
>              int requested_pa_size = 64 - clz64(vms->highest_gpa);
>              int pamax = arm_pamax(ARM_CPU(first_cpu));
>
>              if (pamax < requested_pa_size) {
>                  error_report("VCPU supports less PA bits (%d) than "
>                               "requested by the memory map (%d)",
>                               pamax, requested_pa_size);
>                  exit(1);
>              }
>          }


Turns out I can sync aa64mfr0 just fine as well. So I'll just do that 
and remove this patch.


Alex


