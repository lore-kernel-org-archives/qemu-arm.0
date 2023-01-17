Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2492001ejc;
        Tue, 17 Jan 2023 07:54:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuz3BxD9h0M86tExoAgp9bkKYfOGejU9ipa5leJclIB5wGJJQr+xrx12/BdrFMTPsRuO3Bn
X-Received: by 2002:a05:6214:5e04:b0:534:fe5d:d146 with SMTP id li4-20020a0562145e0400b00534fe5dd146mr5179472qvb.0.1673970870593;
        Tue, 17 Jan 2023 07:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673970870; cv=none;
        d=google.com; s=arc-20160816;
        b=sRauke30wRo7L4ORnUR7fz3WC9xh0ljuSQzMubo7n09wUvoSXA2wDwjCvF+IMfTlmr
         hcxooPDLeUcVM1Toc3I0VGX+Jsoq7rdKniIo+Pip/Fvw71VqVlBX4HrJZX0u23V/BzNc
         GJ+hXrK1Uy1NeoAyrjrf0y/CZKR0RO1NIMDvmuCOXbyqXlyHNqpuiHwCV2qWFfzYdl37
         ignBgZ8RPGpEwfKyymIRjbsLDSgpjXNmeCw7MWgEK45UR/izyo+64VPY/o4USOa/TtfO
         /X2Jvn24ExgLYEGcXkW9edjBn+mc+sq0C+jYLz6ejmQ+KjMnkqIrYMtJOrsjB73BsnfC
         hMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=iaogCjz4EChNGQHxe3+dtvz+b1SP29C1BnnwBTehryg=;
        b=0oDcQZFFgx16wG7FwAu3STG1bqGgGwChGMi/6XWE5/ZEutvawp/yBTHUE/nVxXQtEo
         ciaPE5rZZPl70sB6Ts0pM5xr4BxQYSd8iWBV2To7QDJMbVUFLk1+AakukbHrMikfqUC/
         Xis+7uREwG3eOYsfAFt3uuZR4M549YSLozn8F77WH3UdLjR8566MP3yO2yTddTLeJM5w
         gbGnJyFoBJSVX+/KSsywLyUxzwYwaft44Po2gYMQVYMt83dF1MvTQBxehfh3fmiLwjd2
         5uB3iPeNiS3sfTQufDxXY0eItvC5//R+LBuZfHcRNZgTUcF61n29MxQAgKPe6zHYQ/Le
         unWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CVz2oFzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a05620a102400b0070620b5d07bsi1151699qkk.127.2023.01.17.07.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:54:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CVz2oFzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHoHt-00083M-RB; Tue, 17 Jan 2023 10:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHoHs-00082u-6R; Tue, 17 Jan 2023 10:54:12 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHoHq-0000cz-JE; Tue, 17 Jan 2023 10:54:11 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 69BED20DFE9A;
 Tue, 17 Jan 2023 07:54:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 69BED20DFE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673970847;
 bh=iaogCjz4EChNGQHxe3+dtvz+b1SP29C1BnnwBTehryg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVz2oFzkaL5NaVPOSuF2ktsTucl0PjDSQNcfibOXf1haE2SNd1wIc5JygtaS0V5hK
 dI67YciXx0h13hPPzKPQTpe1+tWVAdMPIAk1z/e2lqDN1kZL2GtvC4hZgujP4jM4Qk
 I8c2YRg9joSptXWa6QoKo04NswKqVREunhm7Pktc=
Message-ID: <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
Date: Tue, 17 Jan 2023 16:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: AHD2kwSG7Fve


On 1/17/2023 16:24, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> Current FIFO handling code does not reset RXFE/RXFF flags when guest
>> resets FIFO by writing to UARTLCR register, although internal FIFO state
>> is reset to 0 read count. Actual flag update will happen only on next
>> read or write to UART. As a result of that any guest that expects RXFE
>> flag to be set (and RXFF to be cleared) after resetting FIFO will just
>> hang.
>>
>> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
>> depth handling code based on current FIFO mode.
> This patch is doing multiple things at once ("also" in a
> commit message is often a sign of that) and I think it
> would be helpful to split it. There are three things here:
>   * refactorings which aren't making any real code change
>     (eg calling pl011_get_fifo_depth() instead of doing the
>     "if LCR bit set then 16 else 1" inline)


Yeah, tbh i also though i should do it..


>   * the fix to the actual bug
>   * changes to the handling of the FIFO which should in theory
>     not be visible to the guest (I think it now when the FIFO
>     is disabled always puts the incoming character in read_fifo[0],
>     whereas previously it would allow read_pos to increment all
>     the way around the FIFO even though we only keep one character
>     at a time).


That last part i don't understand. If by changes to the FIFO you are 
referring to the flags handling, then it will be visible to the guest by 
design, since that's what I'm fixing. Could you maybe explain that one 
again? :)


>
> Type 3 in particular is tricky and could use a commit message
> explaining what it's doing.
>
> I think the actual code changes are OK, but the FIFO handling
> change is a bit complicated and at first I thought it had
> introduced a bug.
>
> thanks
> -- PMM
