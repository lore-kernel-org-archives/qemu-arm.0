Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2767436njb;
        Mon, 3 Mar 2025 09:27:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0s53UfdUxvAmoZ/9oxttdGFGAAQdMzTl44jSctzen/5+Up4mrJn58zGykye2HtnJpaAAh0e/KYXglvw==@linaro.org
X-Google-Smtp-Source: AGHT+IF1pg7PgVCZ/9zPxCrNYeRZm5FuwSA1nOZ7pdVZIKa+rH6cy+xCY82UmZsW+DLSwdz5Ntz3
X-Received: by 2002:a05:6214:2b0b:b0:6e8:89bd:2b50 with SMTP id 6a1803df08f44-6e8a0c86864mr221332096d6.7.1741022843875;
        Mon, 03 Mar 2025 09:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741022843; cv=none;
        d=google.com; s=arc-20240605;
        b=MJGThJ3QwIOET8/woRL8ignAiTXrRp+jEP3y+rUYhrz82/nTvrV652FA6BvFsoMBRi
         qLDyrXKk+tWjt8w9DQppcpvV+Dl/8SxZCiX1WcD1wj1u475fGTHfSmcHiSaKG3tsW5mW
         dinIf3M3NQo9u7eOp6blCyvx+03Lx7OtTZOElKypa4FZHC54+nbWdSo7k3hYT8Ib1pem
         AVG2JZ4G+ti9SUZnskKdV958tuHom16xy+yKd0mw+kuZnonWet3mpCkC2EW578kN+HT3
         JQD5tCC/SmZ2/gZ2hPmt0+nDyhrmzArXFi+DK6SYTm+zQvOJqZy2266904MIyKvVyxyL
         Lmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CSreCeawk6aPyHUuUw/+V6K5AWOXRypxXTe/QVGQIMo=;
        fh=kuU/pGMOeyIWFij4mDmy5fCGiPvroku5Tu7qAE165yg=;
        b=LkoX2Rt4SFSxdVz5SbxY5RuAbQiG8avEuR59wpSX+3jTgs/Nb134rjC8hh/PKtyLJb
         ucNZegUogtw2tPl/ouX7SFAsUBwOYDvaWuLalQrC0aEr4b88j2uVZ/fLUV/1oZolhHiM
         GaNM9rks+hXg36R79ib6svBdUSZ0usJiq73J0jK51J5HRmKtMHv2aAPsDhZcgGBvUE+/
         JxVZ5ICIv7/X5IucikWJWcYjlJMxTySapqkn5laN08RbosWtaJ6f9Q7i33hnN0QxNklR
         pGHPkSpY0ZROAG8olY18z6joD+EhVeLjWnUM+u973jXMPDrBx6C4xKNX+vW8Xwz3d1pT
         oUyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lo5cJrL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8a0d094adsi77060216d6.4.2025.03.03.09.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 09:27:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lo5cJrL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp9ZD-000856-FP; Mon, 03 Mar 2025 12:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9Yu-0007xe-J3
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:26:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9Yj-0003yW-Pn
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:26:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso30892725e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741022784; x=1741627584; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CSreCeawk6aPyHUuUw/+V6K5AWOXRypxXTe/QVGQIMo=;
 b=lo5cJrL+I4pG66+BCdzA4Hu2cFaTC92BdrNxnFNTkfmI0Ejvg/ttpi37cvkb/30kBc
 XmAUucIjeY7mGzuqUK317xBtKlJausKOp299I+Diucl/eo0VjfiYz488MjI3E+FM9tvl
 nnvwXtebnTViqJXXHVeArfEbcHco+NFe+F9OqrYWanbhHg0cBjWzpCP/iVds20xcYx0/
 BOp36cZZ8UjDTVjZSiC5U2kXEpLl9uyFV8nonJ4SedYFRbu01LDptwdKx5fbe2BGk8RM
 8fgapJ/AydWH3jUNxpZkfJz8g26qe5/A48pUIHgH9Zt9AiJtp2vMLBmAwh1JC8tr/DFw
 RWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022784; x=1741627584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CSreCeawk6aPyHUuUw/+V6K5AWOXRypxXTe/QVGQIMo=;
 b=QvqVLPj0DVFp5U3rWD01iWUwflMLfjXUTcwT35o9ec+LjBMZAnntBn9eKo7PXfZF/f
 Ps3mkkZOKr0YXnEVkJ+SDe5DSPkz+aqYzEBG8tXVQQkEzPr9FesEw8DozCxnQ11xuA2W
 S1zbYMNfvzCXU+efMoTDYR3MH9hzthmj4cv9MmWGnQYccZnZnWvbSd+xLrCLucQn9LDd
 DJLDc+uNhYAPjGsXGGK3k+2xM0zMq1BfA8kbeMupa29MfscZq9E2horqriNLUWmLNFEU
 dvVKMcvPC0DBqFSvXwz6xQZVaB74pXcSns1dPYNcN6apXBCy7VBHeKwDOMuQllizIpPa
 1Jrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfzh4uuJ289MZmH02gIiq3lI57OQiuo4enPKFCOTdy+auOcOgTTEbvxaMdkC0NtFv5DiuvRfPRFA==@nongnu.org
X-Gm-Message-State: AOJu0YxkMbx1F0ZytVf7mRNxLu/PhwBvYfLQE9/k22LVgRE4Hl/uz6nV
 9XCjQSwhlyrtbiX9+XlCckELMAxaDMPuY0vjkq19HWIvAdNXxbHepAnZ1gy/J20=
X-Gm-Gg: ASbGnctMh8fnEwSm7na1Zo71HNK61KX3o0y0gX2Iyu7AHYlwwnEwCN6GDxHPibYxdjh
 MtRc+mh0zzY8LvbF/1un0dCe5bC/+tK5QHaEtkDNOEei1JKz9DNn9V2CgelSyzXlBuwB/N/NiOS
 VScCSpBIysuoIBnfr64QPqZdCxVywsNs8y73QazLU6YMoB7lILSi5sz/cDempV5LEFBjzsikxLu
 0li7Cfiom3DzORyV4hE9G44DB17SRFIJBcATuDgqOkous641RMzCucDcVsEA5Ay1q4jJOwJdqSC
 97n0dQrynFyyF4QzZDN/POLirHrmPkc/Tkh0HCbXMi+NC7YEM60wYSUNnqrPRwWJgc/lVgKHN6Q
 71CydArLsBHz4
X-Received: by 2002:a05:600c:3516:b0:43b:c528:d0b8 with SMTP id
 5b1f17b1804b1-43bc528d48bmr31615855e9.5.1741022784143; 
 Mon, 03 Mar 2025 09:26:24 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc743f649sm24034325e9.27.2025.03.03.09.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 09:26:23 -0800 (PST)
Message-ID: <24656a07-1f17-4762-9141-f7c6c6f066d4@linaro.org>
Date: Mon, 3 Mar 2025 18:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/11] New vmapple machine type and xhci fixes
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 armbru@redhat.com, qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250115100747-mutt-send-email-mst@kernel.org>
 <CAAibmn2-vP1ukGwQ8cj6aswjVXMFGi0KzJV3xDPD8SKVH44emg@mail.gmail.com>
 <20250115103953-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250115103953-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: N7KWCzyiqx/T

On 15/1/25 16:40, Michael S. Tsirkin wrote:
> On Wed, Jan 15, 2025 at 04:33:45PM +0100, Phil Dennis-Jordan wrote:
>>
>>
>> On Wed, 15 Jan 2025 at 16:08, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>>      On Sun, Jan 12, 2025 at 10:00:45PM +0100, Phil Dennis-Jordan wrote:
>>      > This patch set introduces a new ARM and macOS HVF specific machine type
>>      > called "vmapple". There are also some patches for fixing XHCI spec
>>      > compliance issues and adding a workaround to a quirk in the macOS guest's
>>      > XHCI driver.


>>      just to make sure, who is merging this? Me?
>>
>>
>> ICYMI, Phil M-D has already pulled patches 1 & 2, and Stefan has merged them
>> into staging & master.
>>
>> As I understand it, Phil M-D was also in the process of merging the rest of v16
>> of this series before discovering the GICv3 dependency/Kconfig issue:
>>
>> https://lore.kernel.org/qemu-devel/
>> 8554330d-fd9b-4fa5-b37c-161f70b71f7d@linaro.org/
>>
>> I don't really mind either way who merges this, but he might have some more
>> thoughts on the matter - there might be a specific reason he's so far only
>> picked up those two patches. :-)
>>
> 
> Excellent just making sure it's not lost.
> Thanks!

Now queued, thanks!
