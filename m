Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1251588wrx;
        Thu, 28 Mar 2019 17:40:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBVgGjJvH0I3NTjTGyItEu/K/4ZZ/ZRoU3xaSNhBoyqT7jrTwYEsjDKvyFwhqJmZO42NNs
X-Received: by 2002:a5e:cb01:: with SMTP id p1mr604402iom.100.1553820008645;
        Thu, 28 Mar 2019 17:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553820008; cv=none;
        d=google.com; s=arc-20160816;
        b=jtHL894ggB54TePNBT9SLZAvbtINeqpNnBBIo4KDuCF87LSpQ0iVtQY3B9t07TM4dn
         uJF9vy6I9VtMlojlCFg8wO7SX9QSM/NaKyzSRji0ysaiXy6DHrpQJa9zOnLgiQF3tv/6
         6nEf3Tn+MY/rVvjrTAaISpSTJESzGG3PMgYrx2epGhJAU1wL7VY4vWSssUFYiwMQN+i8
         lLS9gokfh4Q9sAK2Wet29mgrZuuxoNUzAfqEMiDm5VIauWJA3rAhsDYbOPeOLonUh4Ji
         gEdd7UxbKKD6ICS/VuqSqnnnpbJVMqRMa6iKgDSFC3igxN3Lffqmz0lBMVjGlTcIES8b
         7aWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIOZXUyq/mehbGvP3oOSBwfy1CoPtZ/CoCjY77z7rjg=;
        b=VV+WwMcowK5rPO8OKby4NJqPYbJ912TV7uQVzwATUMWcmcUxtgr+palRibswyvuD3m
         ZZpo7IzLWBNRkaY66RYq6cbMCqHV3YzOsOhTZCEjK9Ihg0nXk2qer97I+St5xOdh6kDL
         25+zYh2ueLNXLTLRQZU1eg8Dy+E3ag0RPEKVvcIRSfTLiDoEIs7IvGF+9RkyuqN083MJ
         VOuIl6ImtOoJBTCMSJSmlPK/xqHognTk0v21gcpN15nw+vwXQypyFllRhWXjfSLLaDlD
         2CEi34mo505EntjaVNi5UJ9J6ljPFkrtNipwe3lQDTT6b3Zi1EtnReqrbun8lE9YU48r
         PxLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pyn27GP3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w72si320387itc.44.2019.03.28.17.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 17:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pyn27GP3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:43940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9fZ0-0007EP-QA
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 20:40:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9fWp-0005n2-5V
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 20:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9fR6-0004QE-1b
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 20:31:56 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h9fHN-0006vq-Uo; Thu, 28 Mar 2019 20:21:54 -0400
Received: by mail-lj1-x243.google.com with SMTP id h16so388619ljg.11;
	Thu, 28 Mar 2019 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kIOZXUyq/mehbGvP3oOSBwfy1CoPtZ/CoCjY77z7rjg=;
	b=Pyn27GP3XKPBP/XPOZYrHAx1ITz2KThdMlZj1PVSnSjzO6whVCIqWOrvSCfahcIMKU
	FdRmRJek3f5S91D4fEvpEHpQjWiFZh8HB3fMpsYaB6YqRh+1dGksBwYLVyDHl5wp+qQT
	Z4UGFMZZe8cwyuPMoRmLf9Am1ifVGRiRS7ButSzhrv81Hp0l4YAmq7RY23omY03SSd0w
	b1juI2gkfJt9QQT5BiNjbYvb/pmFvqHeG1Iy92QpT3Hfbw2DC3GaJTt6ptUfKJRixWbk
	NFq7lFh8kYclLTU065WS60wTe5FQhuxaNRZDZIhdPUu9G+5lrd3RDaZbsiH3ktJqbywI
	vpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kIOZXUyq/mehbGvP3oOSBwfy1CoPtZ/CoCjY77z7rjg=;
	b=nb1/vQGHNDwoA8MSRyuJ4GAShDq4yZ26JM8TOSZ3NLBSiWQ6JbmV+fQ2vvdMe6S5F6
	r/1vRYqRgThGoaZnNcbCW5YPpk90Imn499qJNQ3XjVosmZ3Ag4QGL9rBZgA1cBJk5L0d
	suqynwTXNfqvS2vtF70mdlJFTBtqU3PI72oTyErGYwr63weaM7l8JgPk+o0AQNm9oCAw
	7hmEHpDBqX1WLtWPQ6gXYqSKotVIfPYYPy4oO92g7l2/pDAT6JKTGDxo7tdk3wYQf/59
	nbkjmMHkri7MUOGpVqSQLoNEF3AtRwiyYssn3NZ4ry6cSjLDujW1wg7NXVenzwuiQSg3
	70fA==
X-Gm-Message-State: APjAAAVw3wFQ8dZ+FaQdsorNN38ptOGFMiAq8zvKHhJUjqf3lQHDUOYh
	OOmq/RIYtzujnS4868wukPeAxJbwipoKQS+YgD8=
X-Received: by 2002:a2e:99d2:: with SMTP id l18mr16528910ljj.27.1553818912188; 
	Thu, 28 Mar 2019 17:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152635.2794-1-peter.maydell@linaro.org>
In-Reply-To: <20190328152635.2794-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Mar 2019 17:20:29 -0700
Message-ID: <CAKmqyKOL0C9DPA6C8t7XXzm9kp=b6LFvJWL5X+=ARpabQ0sycQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips: Avoid
 variable length array
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/yFbLfacUMl

On Thu, Mar 28, 2019 at 8:39 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the stripe8() function we use a variable length array; however
> we know that the maximum length required is MAX_NUM_BUSSES. Use
> a fixed-length array and an assert instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Who's tree should this go through?

Alistair

> ---
>  hw/ssi/xilinx_spips.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 16f88f74029..c615058cc1b 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>
>  static inline void stripe8(uint8_t *x, int num, bool dir)
>  {
> -    uint8_t r[num];
> -    memset(r, 0, sizeof(uint8_t) * num);
> +    uint8_t r[MAX_NUM_BUSSES];
>      int idx[2] = {0, 0};
>      int bit[2] = {0, 7};
>      int d = dir;
>
> +    assert(num <= MAX_NUM_BUSSES);
> +    memset(r, 0, sizeof(uint8_t) * num);
> +
>      for (idx[0] = 0; idx[0] < num; ++idx[0]) {
>          for (bit[0] = 7; bit[0] >= 0; bit[0]--) {
>              r[idx[!d]] |= x[idx[d]] & 1 << bit[d] ? 1 << bit[!d] : 0;
> --
> 2.20.1
>
>
