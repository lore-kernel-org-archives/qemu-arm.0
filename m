Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp645966ejc;
        Thu, 19 Jan 2023 13:59:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKfHo8DnHjfGHWOsNgjsRLsA4mcIhIgZNxONYNcoSqssvKU5HZ8U80cmqRbf7HtbQj52ex
X-Received: by 2002:a05:6214:5091:b0:535:1fde:729c with SMTP id kk17-20020a056214509100b005351fde729cmr23350024qvb.42.1674165597173;
        Thu, 19 Jan 2023 13:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674165597; cv=none;
        d=google.com; s=arc-20160816;
        b=d+7LFTtP5rZbwI9CKTaRglIo3HygGZQBwOUv4oAixoTax0luSNP+mQZtzxYPAMRaWC
         bznZNJywBdtxb9Z6UR148a+QE7lyBgXdIWUe9BubYjPlg3BKNStr3OlbyTNGXpwK1v0j
         7CY1iqk79zZ9ePQ0CVMZwYY9vgS1qG9S9HhmrZLNbNBlHH90GYf78XOVpumVlbSKA2to
         uUPeiZJDuq2+6nEXm0Fmvyp0iZ5s7Z3dJWs2c8mlPMqXzyEpSiS5Y7yWqt6VTiOd5PtO
         geDJcTZhqkraCOJba598Hl9klJcgyZAWEAFlbIQJ/WlTf1LSH/1kSDzPU8l5M0Yi43BN
         iR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=jsK45Kzhec33n4ZMGu42lWfnqqm4FRUJ2O1s19IbE90=;
        b=M6euTZ9ewljLzTz6rXXL4sBaptaawxy4YKT8swqhL9SQtrOqV2l5v3oFmZDZFmhM2E
         bp7MT7dijnIbX3AmdkUW/DUDMawNa/V2+F+NPRGIlY+vv3TRS63It1LQCIDwayCmQY4U
         9fZPRQcixFO+EMqj6EhSvPtdGF50YGYatGE4qmi/nJhFma5WY5ctuG4QphJ/mDVcodmz
         oGwUSAmLQCCcg8ktN+KX+5q9kJZRkqCqqcnhxZUZvH8Z9dAO6xlvAbKC0E0gTECAJa9f
         FbZ6wUbroHR0TW5yS011UZB8eqb2Gs6+tA68iQEEmaXPTEET8HDbYl2dv8IBbjQrVpVl
         Cayw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DlA9qAMg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a290700b006fec5425cc5si7076648qkp.642.2023.01.19.13.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:59:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DlA9qAMg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcwg-0000jc-7Q; Thu, 19 Jan 2023 16:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIcwe-0000jD-53; Thu, 19 Jan 2023 16:59:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIcwc-0005ra-47; Thu, 19 Jan 2023 16:59:39 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 604EA20E09FC;
 Thu, 19 Jan 2023 13:59:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 604EA20E09FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674165576;
 bh=jsK45Kzhec33n4ZMGu42lWfnqqm4FRUJ2O1s19IbE90=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DlA9qAMgOP9NVsfCC6GpI3SPGG5GVvMLKov3GnRzEMAwbGqrpIxx/H+wwKVyacp3f
 EytUHyRtHuPPTllGMeGr2XuFZiPQah7Ww7PDjcAEeoTqlz2mY2JDnoi4KBsmLUW7rJ
 CjmvjeopAvXUPNcqwpDso1kiUg8kt0E5TZRlSVoY=
Message-ID: <71985634-92cc-5da7-91a0-c48ab7bd664b@linux.microsoft.com>
Date: Thu, 19 Jan 2023 22:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/4] hw/char/pl011: better handling of FIFO flags on
 LCR reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-4-eiakovlev@linux.microsoft.com>
 <CAFEAcA_r_jeuFnpJfDkvhXCWKO81wHTuE31Wsjuuu8_Uaxfc6w@mail.gmail.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA_r_jeuFnpJfDkvhXCWKO81wHTuE31Wsjuuu8_Uaxfc6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: /KtZeGnhAo7n


On 1/19/2023 14:30, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> Current FIFO handling code does not reset RXFE/RXFF flags when guest
>> resets FIFO by writing to UARTLCR register, although internal FIFO state
>> is reset to 0 read count. Actual guest-visible flag update will happen
>> only on next data read or write attempt. As a result of that any guest
>> that expects RXFE flag to be set (and RXFF to be cleared) after resetting
>> FIFO will never see that happen.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> ---
>>   hw/char/pl011.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index 404d52a3b8..3184949d69 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -87,6 +87,13 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
>>       return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
>>   }
>>
>> +static inline void pl011_reset_pipe(PL011State *s)
>> +{
>> +    s->read_count = 0;
>> +    s->read_pos = 0;
>> +    s->flags = PL011_FLAG_RXFE | PL011_FLAG_TXFE;
> Should this really be resetting all the other flags to 0 ?
> I think we should set/clear only the FIFO related flags, and
> leave the others alone. We don't yet implement the
> modem-status signals, but if/when we ever do, clearing them
> would be the wrong thing here.
>
> (Reset still needs to reset all the flag register bits.)


Right, i thought about it, but as you mention we only use FIFO flags 
currently. Still, your suggestion about future changes makes sense.


>
> thanks
> -- PMM
