Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2784934ejc;
        Tue, 17 Jan 2023 14:07:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNP3TAGdfkkeooKYegWlEwr85syMXgegFalRio/W0qjbzBhmZQObfTqF69XVkr3tQcOc5s
X-Received: by 2002:a0c:efd4:0:b0:532:2dc4:c5ce with SMTP id a20-20020a0cefd4000000b005322dc4c5cemr33225058qvt.29.1673993225739;
        Tue, 17 Jan 2023 14:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673993225; cv=none;
        d=google.com; s=arc-20160816;
        b=c7N6e6BKNJ5maUuF4z3AjUUEXPKOvrYwRi4aspN0TM/2SxzWsUMKw/oelnzMvYketS
         zfA2kGSW/FTgWtsDFKmeOfFaf9tRg+2l7HgH6NEg0yynYs1WUxekf0CVs04ezij8bbrr
         dKROyd94kzmaW5/Mu02eLqQd62hpZul5D/NZeyyq9FoRs8CVcfOV83jBQtt4QWPCmvB4
         sRyUgHScaV/frwOuaHo4nd+EO4VUoD04AAdvYKMSSCsb8BXKcwNogyzjPiZz0Ejv2UeG
         CtjPrTaS6Uiy3gBwhs+JZnz4gjAKbDclco2dqeGkT8FXyhQigroc4GZdCEci8Znbkqwc
         d8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:subject:to:from:user-agent:mime-version:date
         :message-id:dkim-signature:dkim-filter;
        bh=em4MsoHXlRnwzHzecn9clyK5jiawdFbw0SnpG8aeTBo=;
        b=Ft7KBcQ7n9QcMLJPjXRoVpiNTrPcpumiDcRLndWmhvlYEtid23n0vhbibJT+gNFMJ8
         PV8ZI674Br43+ZJfqaOaSKtr713yg9OuYkk2jKnfN4/AVQ116XzeSH78SKTxhQzmmVXG
         M6m9lkRwp7hhHLIvsxLestvhD+DuUJYqQuzpRL3nL6rsAdVXadF3K8fKbtUahMlGyx+J
         dEyStADdXPV8zF2IKTUt6lES0b+nbtW9uwgxrSIDjmLRrwvMhnR7roj3RV3c9tBLOSEO
         npJ+do2XM1S3aaancGl9B1IK+u0hBd0LfdVmRx0I4U0LmDVBJGRWxCAr39cz/TVS8XjP
         KLVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CXDdKRFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a0562140dc800b00530d08f3da7si20589307qvt.336.2023.01.17.14.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CXDdKRFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHu6X-0004gT-GA; Tue, 17 Jan 2023 17:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu6V-0004ca-As; Tue, 17 Jan 2023 17:06:51 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu6T-000757-Cp; Tue, 17 Jan 2023 17:06:51 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1CB0020E09E0;
 Tue, 17 Jan 2023 14:06:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CB0020E09E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993208;
 bh=em4MsoHXlRnwzHzecn9clyK5jiawdFbw0SnpG8aeTBo=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=CXDdKRFshS6ZxHMr96yNCg8dMsrIZQBpKZbQPkFc8ukBwdKDmwOAQHrP3dVD0AvZ2
 dCtiaM0ZRO7Ko3gLyRMgCnp5xmykXZZdpNtHUPjkQQapONrFJFJVoh9JS/1Y5l0dVE
 ic9U2EJ1Fetyfp1MUih8ZOwLVoDmwu5e+ZHop3/g=
Message-ID: <c8eb0fb6-2c37-dae9-da9d-8c6107e07a18@linux.microsoft.com>
Date: Tue, 17 Jan 2023 23:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: eiakovlev@linux.microsoft.com
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
 <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
 <CAFEAcA-UuXdF5-akaiu0Nsg1c4T6pnQbpBh2pDK0gpc19+RrGw@mail.gmail.com>
In-Reply-To: <CAFEAcA-UuXdF5-akaiu0Nsg1c4T6pnQbpBh2pDK0gpc19+RrGw@mail.gmail.com>
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
X-TUID: wmOnayNT7Mzx



On 1/17/23 5:02 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 17 Jan 2023 at 15:54, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
> >
> >
> > On 1/17/2023 16:24, Peter Maydell wrote:
> >> On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
> >> <eiakovlev@linux.microsoft.com> wrote:
> >>> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> >>> resets FIFO by writing to UARTLCR register, although internal FIFO state
> >>> is reset to 0 read count. Actual flag update will happen only on next
> >>> read or write to UART. As a result of that any guest that expects RXFE
> >>> flag to be set (and RXFF to be cleared) after resetting FIFO will just
> >>> hang.
> >>>
> >>> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
> >>> depth handling code based on current FIFO mode.
> >> This patch is doing multiple things at once ("also" in a
> >> commit message is often a sign of that) and I think it
> >> would be helpful to split it. There are three things here:
> >>    * refactorings which aren't making any real code change
> >>      (eg calling pl011_get_fifo_depth() instead of doing the
> >>      "if LCR bit set then 16 else 1" inline)
> >
> >
> > Yeah, tbh i also though i should do it..
> >
> >
> >>    * the fix to the actual bug
> >>    * changes to the handling of the FIFO which should in theory
> >>      not be visible to the guest (I think it now when the FIFO
> >>      is disabled always puts the incoming character in read_fifo[0],
> >>      whereas previously it would allow read_pos to increment all
> >>      the way around the FIFO even though we only keep one character
> >>      at a time).
> >
> >
> > That last part i don't understand. If by changes to the FIFO you are
> > referring to the flags handling, then it will be visible to the guest by
> > design, since that's what I'm fixing. Could you maybe explain that one
> > again? :)
> 
> I meant the bit where the existing code for the FIFO-disabled
> case puts incoming characters in s->read_fifo[s->read_pos] and
> reads from UARTDR always increment s->read_pos; whereas the
> changed code always puts characters in s->read_fifo[0] and
> avoids incrementing read_pos. I think your version is more
> sensible (and also matches what the TRM claims the hardware
> is doing), although the guest-visible behaviour doesn't change.

I see, thanks. I tried separating this particular piece into its own commit, but i just feel like it makes the part that's left pointless, because pl011_get_fifo_depth replaces mostly just those 2 occurences anyway.. I've added a paragraph to a commit message to document a functional change. Let me know if that's not good enough. I've sent out a v2 with the rest of comments addressed + a reset method for PL011.

> 
> thanks
> -- PMM
> 
