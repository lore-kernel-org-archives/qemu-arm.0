Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7074934wrv;
        Mon, 22 Jul 2019 09:22:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFuc5+u06iJkczM85hPVNhwcEl+Wm32w/rTRLrKhWE7pNqb20b43V30BLlqcrzw40asLnt
X-Received: by 2002:a17:906:470a:: with SMTP id y10mr39014827ejq.115.1563812539691;
        Mon, 22 Jul 2019 09:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563812539; cv=none;
        d=google.com; s=arc-20160816;
        b=oQU81x43wR5TIhuCzfFBbfvaF6D4MjGQyAKMGp1b6wL0uG2h90C8b7B5houJ0qyZJE
         noosgvqf9GqZwiy0Nm2/+sYo0rf/dCZ5ub7V+gWs2WFmnQgcPcHoodzbNsy31FpHBPt1
         tudnWnZ/4FUfPcH/ieTH1aMcUdvTD/hbAe9al7L5/l9dKs3qGLXYCF9aCjZXtBzXRuWa
         goBWhjE6SmOMY9k6tFKJdXUDuhW30BBuK3kdz/1uOYfYQrQMJjgQussB5TdvzPgLl6Ii
         A4WRbLLDtxM7yzwaS17dKWqXJ/FS38I6QJxeMGwT3pnCQcb1NKcsmogZKAcAqj0RY/oe
         kqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=PwkBfELRJL91fx59DzQCj2IthEohyTfywm5LOq0HTjY=;
        b=skswRkBkuii1mcaHMcIpeCx8KHWJFHun371a6j5OJSEd998kSrNk/NgsanwtckMRLZ
         m9sXMBs/h0r0fuo97dL03YpPjrdw7+004UbFc2nY8z/rslEChaoQPakfSnKX+v0TjXmX
         JD2TwddGaszCAL58ySy3LBcQi1C0HoZYaKlVM1n5oOmfP/45tqa4rU3EsJsSEhj7mU44
         30V2sOPoF62FhmWRMoqNLt2gTiMms/WuepoL/55/+/fM3CYKpzoLTbESgdj8cewzP5it
         kSmczK6/H4RfHrSHjgLwTV+i9/rsF3899d3yaKXDDEpeD1L7CYPJH+uxIFEZlMlM9S14
         HVJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si5685052edb.281.2019.07.22.09.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 09:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpb4s-0008O5-Ld
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 12:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35083)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hpb4g-0007qN-Ia
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hpb4f-000361-Hw
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:22:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hpb4f-00034m-9N
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:22:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so35821682wma.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 09:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PwkBfELRJL91fx59DzQCj2IthEohyTfywm5LOq0HTjY=;
 b=U4G5ME7ISZBb0BK8sZ3vYjqb1E64suEXZu8GjNRtsYhHY4+67Tu0gag6fuwQ/Sx3dn
 G9jubANlSyblAu51YyN5n6DShujehPzxF9vBRjRX4y5BRLlcJmNSrfE1A9XgmrjfpM7W
 4KHW0GRdfaBPoN8WI8vTScR6jAci/aaWeSvi/tz5PmAIegyguw2VRXTIkr3gbOSk5fdD
 r1EvoSl5L6FhdJNx80CU1xnXDvkjjCvcrURhm3ovzB5Ja5By3DhdjI+WQqJSnMNc5kZg
 TsInVwY6E6w0gjrO/2n/21usIrZXdAF4jMbs0QIpB4hMwKblIxywEegVV2l8xhN4dZw/
 MChg==
X-Gm-Message-State: APjAAAUrjGu02Z65CoZzfAC/ZEb9UGrKtaNb8yxMlRTDBz5VXLMM7ERe
 nUVW4CBU+mSKuEE/LnDxORxnMQ==
X-Received: by 2002:a1c:5f55:: with SMTP id t82mr63522468wmb.111.1563812524125; 
 Mon, 22 Jul 2019 09:22:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:10f7:67c8:abb4:8512?
 ([2001:b07:6468:f312:10f7:67c8:abb4:8512])
 by smtp.gmail.com with ESMTPSA id t185sm33448143wma.11.2019.07.22.09.22.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 09:22:03 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
 <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d6726b14-96e6-4a96-41b2-598c90289b88@redhat.com>
Date: Mon, 22 Jul 2019 18:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in SPARCv9 MMU
 TTE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: voz7iYW6wQlN

On 22/07/19 17:59, Richard Henderson wrote:
> On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:
>> Tony Nguyen (20):
>>   tcg: Replace MO_8 with MO_UB alias
>>   tcg: Replace MO_16 with MO_UW alias
>>   tcg: Replace MO_32 with MO_UL alias
>>   tcg: Replace MO_64 with MO_UQ alias
>>   tcg: Move size+sign+endian from TCGMemOp to MemOp
> I don't like any of these first 5 patches.
> I don't understand your motivation here.  Why?

He wants to avoid namespace collisions between MemOp and TCGMemOp, I think.

Paolo
