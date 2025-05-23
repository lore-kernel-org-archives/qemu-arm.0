Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2444687njc;
        Fri, 23 May 2025 03:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu/PpwwUPZ9TAi18ciPE1IfN/qWWOLCpN85q/S4T4KWabtQbfsfziQJpOjrv3cCXCk9wvyvgy1RdTLdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF7bqQpqhT4Oy2RfdU1Dy3fzc9zSZjvW9EyGUokRLO53Q91SMtQdXFM3bp36qXyp8xSGMSL
X-Received: by 2002:a92:ca4e:0:b0:3dc:870a:e07e with SMTP id e9e14a558f8ab-3dc870ae2b8mr95188055ab.4.1747996815214;
        Fri, 23 May 2025 03:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747996815; cv=none;
        d=google.com; s=arc-20240605;
        b=TN0TUuPIvudQfYa4VE/Md/P/H4zsvcP4xHvA1I952HnDQBaV7w7ZSgP88kP9rUH2UI
         0NWutqoxgpq+f1Au9pRdXulK8ptR5zqCIexlHStzpv3nmBtAM/YA9Kv9AhTnP9ahq5wx
         TzfupAAsljCWnT3CpqwUhgS7jH8/RC4VtMT2D9gJNvQce4UY1mKnuyCINnv1R9eWBC4K
         EJiVpPhXHhAxJf50W0bjca3H2Oej1YJTs8SLTRcHM074IsjJbnXMzpnpp3M4FGXQQL+p
         pO8X3Dp+uHODvQiLWlT9kfr7agqTGtR0CDcQ0PyCxzeBHKMiwNiu4pN8bIPTIQnnT2tC
         UBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=n3nEOXUd0K3eBO2aQGa5aMnc1Y4vZOf0CoPFlUYuvU8=;
        fh=QgHpGH3rLCa5kb4qYI2Dd+mOQf4l1wrbOWCqRsxrzSc=;
        b=idyRQvn4cJeA49pMp18ApaJVSHaiYlOuJRgjyp9D1LoMNO9i197rvu+aYwUg89oI4O
         +3JO4bFR/ErBiwOvpLNRMVNfndhTxVhUinB1d02sRbaXfmrlS/Ll4rWpQ/kEzYGSs0di
         UGZRFjVKhyE4aeLKPjRVYcZyRCm9BWHjIs/p7H+5EbhY//kVASccONtF+DWTGS0GzLXg
         QAzsccD55I1+HiicPHOgl8mrPFguBE41/6xX3X9o7IZYWMQh/g4AP5WpzWzqjYQHz2eu
         IF8iMjOzppN3ZSA5kG2KWWnoDWWgKWvO5lVC8zSClpm/juGz4tr12nlEH9+cRUVasKsk
         I6Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc4935a9si14185581173.87.2025.05.23.03.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 03:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uIPoi-0002R1-I4; Fri, 23 May 2025 06:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1uIPog-0002QX-LU; Fri, 23 May 2025 06:39:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1uIPoe-0004np-FY; Fri, 23 May 2025 06:39:54 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4b3hVr1W0Dz4xf9;
 Fri, 23 May 2025 20:39:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3hVm3VFfz4xdx;
 Fri, 23 May 2025 20:39:44 +1000 (AEST)
Message-ID: <97b35cef-8c31-4d06-9658-651d0babdd8f@kaod.org>
Date: Fri, 23 May 2025 12:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] hw/arm/aspeed_ast2700-fc: Fix null pointer
 dereference
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, longzl2@lenovo.com, yunlin.tang@aspeedtech.com
References: <20250523093144.991408-1-steven_lee@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250523093144.991408-1-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x2P4y10dfXpF

On 5/23/25 11:31, Steven Lee wrote:
> Clang's sanitizer reports a runtime error when booting with
> '-net nic -net user', due to a null pointer being passed
> to memory_region_find(), which subsequently triggers a crash in
> flatview_lookup().
> 
> Root cause:
> - Missing NIC configuration in the CA35 initialization.
> 
> Fix:
> - Reduce ca35 ram size from 2GiB to 1GiB to align with ast2700a1-evb,
>    where the ram-container is defined as 1GiB in its class.
> - Add nic configuration in ast2700fc's ca35 init function.
> 
> 
> v2:
> - Split the CA35 memory mapping into a separate patch.
> - Added a new patch to fix BMC memory mapping in the fby35 machine,
>    which had a similar issue (unmapped system_memory).
> - Removed Change-Id tag from commit messages
> 
> v3:
> - Fixed issue with incorrectly inheriting TYPE_ASPEED_MACHINE.
> - Rewrote the commit message for "Map BMC memory into system memory".
> - Added more details to the commit message for "Fix unimplemented region
>    overlap with VBootROM".
> 
> v4:
> - Split the first patch "Fix null pointer dereference" into two patches.
> - Remove the patch "hw/arm/aspeed_ast27x0: Fix unimplemented
>    region overlap with vbootrom".
> 
> v5:
> - Rewrote the commit message for the first patch to:
>      "hw/arm/aspeed_ast2700-fc: Add network support".
> 
> Steven Lee (6):
>    hw/arm/aspeed_ast2700-fc: Add network support
>    hw/arm/aspeed_ast2700-fc: Reduce ca35 ram size to align with ast2700a1
>    hw/arm/aspeed_ast27x0: Fix unimplemented region overlap with vbootrom
>    hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system memory
>    hw/arm/fby35: Map BMC memory into system memory
>    docs: Remove ast2700fc from Aspeed family boards
> 
>   docs/system/arm/aspeed.rst |  2 +-
>   hw/arm/aspeed_ast27x0-fc.c | 10 +++++++++-
>   hw/arm/aspeed_ast27x0.c    |  4 ++--
>   hw/arm/fby35.c             |  1 +
>   4 files changed, 13 insertions(+), 4 deletions(-)
> 


Applied to aspeed-next.

Thanks,

C.


