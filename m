Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2817925lfb;
        Sun, 12 Sep 2021 05:32:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkranHsZ2utb9ug8Algx1XWeywxxXRWG18lCqzNEr79a2mngAuveGg0dppZ0zlEHaNvcyk
X-Received: by 2002:a05:6e02:156a:: with SMTP id k10mr4436583ilu.24.1631449922667;
        Sun, 12 Sep 2021 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631449922; cv=none;
        d=google.com; s=arc-20160816;
        b=IcMA4c4gtmd6/LZrfZn0aBemTnzxAWTZkA7VUDm87PYtDhnc5egqJYBeaioJ0doKFi
         EmpPYorew8MgMVVLQ/roZm3dIGPTbTZR7BuEvld2RHrzvVs5M0DkftOkvwcdh14mpV2z
         755xuYdotTmJEevJRCmJHRap991GrdOsYdXT1faL35tMQq/BFXzJl8fMfJEtJSYT4lrk
         oL/WU4Dst62BMAJP+hMvhzGodNtoBMw8rT5atRD2EwGrj1oyy7S1ZIyGdrSk+ARLazXv
         FVgwn6LBfviuM89mK/s4EMkE8Pbi3f5+MM6oEbA3mjOEq24mCj13k3R2rXgtDSJdAW2r
         yO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l2bSjNJqTwhQZphEwMAU513EeIhPI7Thg1lJpA7i8fs=;
        b=A33gnAMm/v5iVF6gamY0iVLrKbmDsElU6XupHKPx2o/EGpmnRmIkirDTYuHnxLAvpI
         KdDyLNid0R5hQNE6X1IZgZiePzljz4OUiHHN+xW9kAzgRAPnsZMH64brmDj7WhGXH7Wl
         bD1uVaN9TP6fppuQGoT3qdjBMyY0alJajw4fjaB+t5WcS2w3o3qstWjZdBsZxVWNeEjJ
         ax0yzvPTC01Q4j6t+1LG5Hpt4biAZ8fV/LGqBfLAEBVrQjEwUQjc23ACxRQMNiJ6SlFK
         6i3sW6j3vmU0Zlt0oYrcUe18USXLfxopydd73OhIEm+rg4FVO0Lh6FErwrzoua2ydGmb
         JIdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R66inDcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i126si4072819iof.61.2021.09.12.05.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 05:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R66inDcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPOeP-0004SL-W8
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 08:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOe9-0004S1-K6
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 08:31:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPOe7-0008Rj-Bx
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 08:31:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q22so6294262pfu.0
 for <qemu-arm@nongnu.org>; Sun, 12 Sep 2021 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l2bSjNJqTwhQZphEwMAU513EeIhPI7Thg1lJpA7i8fs=;
 b=R66inDcAWt9GQlblcZebPLMwPlHlAnt0L3kyGlH8r3X6FsDI/N/vYwneGzy6f53yoC
 aJSbeJ2HVLZ5IETneJLglbqjOoAzPmPkvYhRyqU7w9yu4eGlZVUBvR4cBjWxsVNMWyQs
 qiLol3oXEuJFHpxM5XDG2HifDgtIlXc6Y+gNn2EVYS2UFBYwOF9tNaPzUqjb6c9xEMKD
 EpbKtmy5jQyQ9JwjSHSZdDyKcuXW75ONjIPM4WmszEr/HJrFRo+qRBybdHwe5FUddKSp
 VhyKUscbCxv1rziWUD7Bm32+mC15T8UjtL/0R3OkiO3/Lb77FRexMdrsOVYoCJhihCLc
 vdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l2bSjNJqTwhQZphEwMAU513EeIhPI7Thg1lJpA7i8fs=;
 b=KOf29tTkwJHs1DZ+znIiMcWiYcpsWTbNLImaULUavxOnX7D9Fp3+x0mFO2kzbwilwS
 XXtqouJYqSDkOEMdJE9E4jmt4HONDE1Yl9H/KmXDFB5Fp7+JtedLUIrA4I76GXrRM+KE
 KPPkAToxnW0Wi9bPWpws9I3Gl0ir3FymMiRRGTJnncKxjeqD3EyC6WuBVYFTIhzUfpj+
 6yMA+jWPw63a5AzEg+8QergIQTf2TmA9bCV5qM8vOeq6wflZ3GshlHCCTeRwZFtqdEev
 8Em7xuytsdPAHmY2oXIPHv0HjLeNyJGFO4C0lRZsdoYuel5tk84ac1hzpHNGiJTD9ZdH
 0f1w==
X-Gm-Message-State: AOAM530dA8vpW3AXSC6P+XgmaAFtut4l1xSavJRTuAr4JEiGNwbrmLu3
 mknZdRfhhN5WEXAgqcVP+G8wXQ==
X-Received: by 2002:a63:5413:: with SMTP id i19mr6469698pgb.297.1631449898733; 
 Sun, 12 Sep 2021 05:31:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z9sm3970376pfn.22.2021.09.12.05.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:31:38 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
 <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
 <fc98e293-f2ba-8ca0-99c8-f07758b79d73@amsat.org>
 <a49e0100-74d1-2974-990f-a05f9f796cc5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82c9e627-016a-e834-6ed0-4c5d49b554e6@linaro.org>
Date: Sun, 12 Sep 2021 05:31:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a49e0100-74d1-2974-990f-a05f9f796cc5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZV4r9F/HQi7G

On 9/11/21 3:31 PM, Philippe Mathieu-Daudé wrote:
> On 9/3/21 11:11 PM, Philippe Mathieu-Daudé wrote:
>> On 9/3/21 10:42 PM, Richard Henderson wrote:
>>> On 9/3/21 2:50 AM, David Gibson wrote:
>>>> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Each POWER cpu has its own has_work() implementation. Instead of
>>>>> overloading CPUClass on each PowerPCCPUClass init, register the
>>>>> generic ppc_cpu_has_work() handler, and have it call the POWER
>>>>> specific has_work().
>>>>
>>>> I don't quite see the rationale for introducing a second layer of
>>>> indirection here.  What's wrong with switching the base has_work for
>>>> each cpu variant?
>>>
>>> We're moving the hook from CPUState to TCGCPUOps.
>>> Phil was trying to avoid creating N versions of
>>>
>>> static const struct TCGCPUOps ppc_tcg_ops = {
>>>      ...
>>> };
>>
>> Ah yes this is the reason! Too many context switching so
>> I forgot about it.
>>
>>> A plausible alternative is to remove the const from this struct and
>>> modify it, just as we do for CPUState, on the assumption that we cannot
>>> mix and match ppc cpu types in any one machine.
>>
>> I thought about this case and remembered how it works on the ARM arch,
>> i.e. ZynqMP machine uses both Cortex-R5F and Cortex-A53. Even if no
>> similar PPC machine exists, IMHO we should try to generally allow to
>> possibility to experiment machine with different CPUs. Restricting it
>> on PPC goes the other way around. Thoughts?
> 
> I'm running out of ideas to do avoid the indirection and multiple
> copies of TCGCPUOps. I'm not giving up, I suppose I'm simply not
> seeing it... David, any suggestions?

I think multiple copies of TCGCPUOps is the solution.  Macro-ized, perhaps, so that the 
amount of typing is minimal across the versions.


r~
