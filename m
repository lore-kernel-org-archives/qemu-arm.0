Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1869535lfm;
        Thu, 16 Apr 2020 07:19:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypI1E9R9ndUmYas/YxG3M72WWxJ/22iC7wJ7BO3lYdbQr2MDfolAfZWVoJAMqIxdE0+dzYAk
X-Received: by 2002:a05:620a:64f:: with SMTP id a15mr31826698qka.228.1587046750177;
        Thu, 16 Apr 2020 07:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587046750; cv=none;
        d=google.com; s=arc-20160816;
        b=sjnsPi7fUyID/463fCnwurtirjI+IUEOEX/74aqNQJ2do+Vo++b/YM9TruIMM+ywD3
         X6ThOvPUXsgJncNeX9ro4GKTj9ZN3AeIBAwECMNSbzmFEwNl12dyIgAoFcxnpsxXkkNK
         SjcpD3xQ6YE/L7Wyl3p4eLLfOAfc2nnpCbjsoyGqEnajU7B0L8Ii8tPK/y29EYq3IdwB
         kBeFxw26CZD3N2GmIxynxrs0jdopO8E3uOtcB3AoY5RSi4ojyu6WR62rXp7tWc6eE+qo
         iXyA+Tslq+TruULhWy6wR5+auyf84h5895z9g1DKdTrodfw4hwONPUEgkJgvejlR1UxU
         3OGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMeJfc+vCl0HW4OFAaGQKhiEiYWeHp3jOvXvTEYD8EY=;
        b=n/9OK5/JnRT/Pyd2vTex6+1fO876x/7H8vgbQyk9GueJXGMpnRLSY8ob0UFuKG6DK2
         ZSTNiI/8omHAH+IHr2mlSJVJ8XCY5nDMyddndklQMueAcP1zazjM47EEorbJNTznGF3v
         MIU6RXgvdnJP0BnOmNgvJ6NaNAyj2RWkPhC9fjl+edNVa9DR9RJ16TTyvcSh9vgkssJK
         iOmBYke9CCc0SYWxvtKhpr6E8m8Z0pgr1HmtmyC2/olf6b15Uy6vzOHUTqfY0Jh/3sn9
         J6EvJNQYkFqK8SLh1nwWn8t9YlsxAHBBqysBk2YvGyGCF9mbtBPh/WQvaZiiwz/V1h+/
         4Bwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ax8LmD9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b67si5816243qkc.239.2020.04.16.07.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ax8LmD9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5MD-00049n-KK
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5M6-00049L-AQ
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5M5-0006Bz-FP
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:19:02 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5M5-0006Bm-B1
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:19:01 -0400
Received: by mail-oi1-x241.google.com with SMTP id r66so2533897oie.5
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMeJfc+vCl0HW4OFAaGQKhiEiYWeHp3jOvXvTEYD8EY=;
 b=Ax8LmD9lkd8WX3GMTamVLV4i2+B4SN7vWs8gYVIIpDppOkmmGCshJrOpAHTPIVUR09
 BCLc87uwxo+svsa8eTAKCe82MgmSurAd8qwt7EbqjBXsas43DriHClwL0jT1KR6G5ZNu
 obqokjG4C7A0WAH3kWpowqh93InqooDmJFdhrtsteXHMdaTfZMwo0/wh/Tn6x+jwV5OP
 WW9SMmI+o+52jIaFeRafw7Uv8J4DmR4Jbe2zkVqksUtKz2ssh1tQLyiEASB+9cRGDpoE
 B1d0hS4rQSNDX9feUaryd4MET7LaheUQJbSNZ0NduKj4gQ6E3wl8ltPlnj8OIoNaGjPm
 T+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMeJfc+vCl0HW4OFAaGQKhiEiYWeHp3jOvXvTEYD8EY=;
 b=iOG6v0p+K0rxEEousQY7KTIh/YZgHxTEQIbfiaDqgjhfbwjZL7BlEQdEYmfn/eYTlz
 JDdnlz9OCkjJaE9vawZMutH3a3vQosJ72CUuH6x2IM70zGByY8sHLlly2ae9QmZ+jLeM
 MCZUB7PP2VKWCbf78reAyT70r2Woey/zvBuK0GUemV7AdKCffBMdN3gfynaoUYv//ap7
 /BNfEgvXmMOhu/p3m6DEtHQU2cH70C9n/itq50aKU6InQCll27lXVYxB+oiDiMOnMVYd
 LC7kO1WN9HTFKWGjTtKvTZU9GC6RePFzq7UOwb8yrkDn37CyDla2yABxMjtktGJnPi3o
 aoLQ==
X-Gm-Message-State: AGi0PuY83tAxvnbYM8Ot0tkuEwVkn6/jz5Mea2+QyZdKi1pKaHsxiGju
 QACdXRtxTf5vWrEOvunW0pRb2XwHUEwSnJtmkUmgNQ==
X-Received: by 2002:aca:170e:: with SMTP id j14mr3025435oii.163.1587046740512; 
 Thu, 16 Apr 2020 07:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-13-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:18:49 +0100
Message-ID: <CAFEAcA80hY9L+sgf=jYmor6ONgumP92_T5t3PTr0kOh1gnAsAg@mail.gmail.com>
Subject: Re: [PATCH 12/16] target/arm: Use SVEContLdSt for contiguous stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rt4Pe8FhMezl

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Follow the model set up for contiguous loads.  This handles
> watchpoints correctly for contiguous stores, recognizing the
> exception before any changes to memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 288 ++++++++++++++++++++++------------------
>  1 file changed, 162 insertions(+), 126 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
