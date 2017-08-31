Received: by 10.223.188.70 with SMTP id a6csp2679447wrh;
        Thu, 31 Aug 2017 09:57:24 -0700 (PDT)
X-Received: by 10.80.174.5 with SMTP id c5mr2052985edd.68.1504198644303;
        Thu, 31 Aug 2017 09:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504198644; cv=none;
        d=google.com; s=arc-20160816;
        b=HzpTUXnEqD6S+qqpwCNh4lHftj9Ng8D7qKNp6KCOZiqhIlVmz0ST+mJehUL/7+240b
         +wiCk6KUM5SUPXGeSgTVkR9WbX94WImRcyo4bBK/TJ9vmBawyOyNhBtyLjiwlIkcyCAv
         jS8DHUK70DrwyOZcGh+DwzHeD/bD6Q5pNFPA3YGyACT2SQDsoHoEkvTFy2fXP66rIGPN
         K6DZbk0mFGfptRaUB4hx/z0kaM8Bph9b6OxGZhnd2yqQZj7i4k3FG01sgFcmxzKwvq3A
         QyjDruRsDZb6+rQVFWaDXFS4nwfRpOvjA5NYmKQEKbTo8Kv6dOWWzuKkmj5Cie4fMmwB
         CUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bmm3AQfywmOOHoWfTukL1SCXKbIZfNJYwR7KWDUQr5M=;
        b=YBOD/bRkeHWQRnIOMklWfk1TvqSVbr8WNKxOwVvK7VSuryJeFvYlN2xtaEnWhGUcko
         fVz9Cc1CyhvgtQGsMY0GUGLONrEt0/+0OfEmh8MtpUYiD2M8YIJet02hfoHUpN4u0wbl
         UkBokFLpSVg5wabzIScXYaJbZN5mPKhM1YlFN/oFYpZAU3SZQ0lqhXGQGgIXpoTdIehV
         cn3YyD7BWIZPsnEEkmkBIv79C3Ge+jWm5s5qf5+ZEFe2V2UEjB9cMdXSYpqW29ay6/cB
         A3i03SxMs1oDuWx4PziTrLuQ5gG7md079oUND9xWjQLxMaXMEErkBVq7X3DLgoQKkQ3F
         zotg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPTnhIy/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si518007edj.305.2017.08.31.09.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 09:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPTnhIy/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnSmR-0001BZ-Bx
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 12:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dnSmM-0001BS-E9
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 12:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dnSmL-0007Zb-HQ
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 12:57:18 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:32977)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bobby.prani@gmail.com>)
	id 1dnSmL-0007Yz-CE; Thu, 31 Aug 2017 12:57:17 -0400
Received: by mail-io0-x241.google.com with SMTP id f99so260299ioi.0;
	Thu, 31 Aug 2017 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bmm3AQfywmOOHoWfTukL1SCXKbIZfNJYwR7KWDUQr5M=;
	b=fPTnhIy/SlgVvlobBN8LKCLVvUxZCIloSfV0dxxAHyMp85YRSj24DXOO6dRDXEoHbu
	nOeWHNsCYolBSAlC5AOy4UIntSH0RV3akBmGIw0USWhtzSBXBEuxz7rsSdFhhhCBlXvT
	z5uPpZqapek9AoKv0jGtNnwkOyHLSwDu0z8pWu8HuxkEO6wvGWmWH6RkScf75F/JoQpV
	O2Z+5uADfjMNtd0RspM/d4uKanFET9eBo1nF98EPqTbGS7nwnjq0d6pDyWbcObCtliOQ
	zaZf2OTXRvplwshReC6MTl97dauz1iWYog/LR8QP5PHbB4P1LUL5MFVERKegDtCSRqrQ
	BULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bmm3AQfywmOOHoWfTukL1SCXKbIZfNJYwR7KWDUQr5M=;
	b=EFodRmYF65gWi9zxp6aJe0cTndzc015eVPRG4sAZljYwTZNIQ/6sh3nfZ9f1zqmJH2
	aaIwWuEhXdNXGduFbt/BruLyuIckXpzlDx7994RboVVN7D83LebEA1pUGAx1M0FIkGOp
	WMrNvv8oNjWEFT/4/Um7xbf/FDa1RdmwktNjGyKQ5xzQ2PETmvIHvQlAmr8EWDTJ8RMB
	fjyDQpsC8NrJrMkCdJmxKfKQUswDCqKw0fxXvcFYoERNOB61d9agxrnXVXubByCzzcQQ
	6GanslMHP1fWmx1mkxVdYostmqb2+Zu2D5T9xIjeuXUF7/ElyvWTI1HlsumSv+Knfzxd
	jYHA==
X-Gm-Message-State: AHPjjUigsihl82iIEQEXPcxAL4BbJAzs/Z6Lw9sChoozLZ1TFYq49+5U
	uxjxU9oxDlTY+Chva2JhXcaZ8QRztQ==
X-Google-Smtp-Source: ADKCNb6z8qqhQm4twEl0Y9z2swWKPhPuge3ZSwqxdo28wdkAgnOWhKF8BY+mQyLZlo8bulRsnLAVEwAnnCmS15DMvR0=
X-Received: by 10.107.129.85 with SMTP id c82mr5218968iod.17.1504198635773;
	Thu, 31 Aug 2017 09:57:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.166.2 with HTTP; Thu, 31 Aug 2017 09:56:45 -0700 (PDT)
In-Reply-To: <20170829173226.7625-1-bobby.prani@gmail.com>
References: <20170829173226.7625-1-bobby.prani@gmail.com>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Thu, 31 Aug 2017 12:56:45 -0400
Message-ID: <CAJhHMCDgm8RRO42PXDOEYE8oZf5OLSBZo+akM1Kx8bOJLTSYCA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM cores" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [PATCH] arm_gicv3_kvm: Fix compile warning
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pcDvvajsS++b

CC'ing stable for 2.10.

On Tue, Aug 29, 2017 at 1:32 PM, Pranith Kumar <bobby.prani@gmail.com> wrote:
> Fix the following warning:
>
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^             ~
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses after the '!' to evaluate the bitwise operator first
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses around left hand side expression to silence this warning
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^
>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 6051c77705..481fe5405a 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -293,7 +293,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>              kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
>
>              reg64 = c->gicr_pendbaser;
> -            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
> +            if (!(c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
>                  /* Setting PTZ is advised if LPIs are disabled, to reduce
>                   * GIC initialization time.
>                   */
> --
> 2.11.0
>



-- 
Pranith
