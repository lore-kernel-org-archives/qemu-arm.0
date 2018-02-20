Received: by 10.28.71.27 with SMTP id u27csp1403180wma;
        Tue, 20 Feb 2018 10:33:00 -0800 (PST)
X-Google-Smtp-Source: AH8x225rpX9DlFu/4afqqzKti5Ha3UuQO0d3rcNbC4SZvehsjRLE9M5rqYL4q9DbhmLWXqzjpaX8
X-Received: by 2002:a25:6f55:: with SMTP id k82-v6mr502301ybc.353.1519151580699;
        Tue, 20 Feb 2018 10:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519151580; cv=none;
        d=google.com; s=arc-20160816;
        b=mc8MW5Pjp6pJUvLOieXp0Z7F/5ifFPjcIi2N9f1cL713EWQndcbw4ooLIPedC4Lm3A
         8TwQhUeIZX0OJ8SraVhUQe8KRoolP5QXwki7pnNNKwZiD4QHsZ4K982fYc8Xg7ZPOeCR
         JwKlTv10Mg0jTtx/5v8q3LUamz8bSpKNkIyZnxzoHCAdAYmUQ+kCJHgFjSbQZnJGfx8f
         aWttVa+V4Q8Z7NMgGK05jWF3O68ryT/AZ09xxVlJQa6h85eg96Vv8pWyq8H+t/QJe6pS
         O9uppnJSo9CGkKCHzwf6SxMVacz6T7UTzI5S2C2YS/yJHmfBP4QM9HhHwoLO3rY+xgGp
         oJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4VqjUoLz0zpShuZwBVcJ75hEjQHLqVS2VNSLj9SRpFg=;
        b=KWy2z11PgKj7x0xY2BE+zXRuhNX1Pj0N4NfLHDsp1EATJwkdQlmwfxd/k4eb7IL3+q
         4hAcuXG+Lf38A5bPPawOSqZKnGr0xV2FCGX/VeqRwRlKD4XS/3dZp9OLugUyeF1ZSAGm
         oiE8qtyMb8PO5Uldq3n7IRROge/IEmhySylAd8Gds1YJWmOfhrSSQKQqHUhMi4sHkzAp
         pJQQkrx8MkqwcFD/HzyuYu7qs4tSVbfs2WUK3DqYlYzu+H/bgjsmy5IyjrqbOsjPwtN6
         j/UNPFd+iLCyIgizkdRC7Knjpsd6rRp6HgNG6xw62lBoo5ZIwyIqVN65LNm4BE+aye3A
         v6yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=clthhaus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187si2947459ywe.527.2018.02.20.10.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:33:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=clthhaus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCiq-0008M0-2w
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:33:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCbW-0002W1-Ta
	for qemu-devel@nongnu.org; Tue, 20 Feb 2018 13:25:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCbT-0007Xw-LF
	for qemu-devel@nongnu.org; Tue, 20 Feb 2018 13:25:26 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:44041)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCbT-0007XD-Dk; Tue, 20 Feb 2018 13:25:23 -0500
Received: by mail-wr0-x241.google.com with SMTP id v65so17086484wrc.11;
	Tue, 20 Feb 2018 10:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4VqjUoLz0zpShuZwBVcJ75hEjQHLqVS2VNSLj9SRpFg=;
	b=clthhausPZ4kDnv5vH+fHfNZ2iYJ01tcBbtlXjFfYwoFN1zVi06jFHCaUfuugLwmXY
	Y/MYEV3JLXPemJqgEPWbbrDEmdsqLV8b6o65t3KVF3RkjkEsnRddA9219nVeuby8P0PP
	bPSbkqgOzp5P5UI7hrPzMISAb6/wCuObfqQRHfgk6Jdbp6mQJWQlB+SaeHfrf4/Vs6Uh
	5lsQYcWtFHgk3DJHRETLiJF32K8QGF939MUw/Z126iZ3wh9Pbwt2cf+I19Rafmf6bgEi
	yAn9E4RIupDzzU8OUeKPYMQ4Wbp06glGcvqvYVEpT1juj8uFanJupPin0TFwznJOjibn
	NCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4VqjUoLz0zpShuZwBVcJ75hEjQHLqVS2VNSLj9SRpFg=;
	b=qJRHRKxvPFX5Eh0noq66j99V0MtCnXVIjHOJUd6TeO/bkfyCfwgFgMOcrDLD8cdvSn
	g2QMeN7swCffiyC9cqBxXOZ9LHfq3h4v2VPz01JGAqRsSIXZDAl6iIYyAhwxO8Ik7cm9
	gUNQyhZqviPOr3NMCreVke8rDUlBdTifkHCcNJF4iAkqrrI5+vf974kmlh6r2sNqo3KG
	tXwpmj6HBx2NGsM12OIOzCOhRSoNxT5RMg1jBcCqdQCqA7s60hxKXLQya5sUI2vinp+e
	c84rE7+QBwYG667er8BvMSjAYSfsSGDpADJ0f3VEDxp92oAgbEVjUWkxzGPyvEeXcB8D
	R+qA==
X-Gm-Message-State: APf1xPAw3saRQ+2EdPe56VyUKHZaVCB0sA02buw/hhEVUkmRwjgQnFPL
	itZWrLUQ9tZoKvCRxXUIC7Q=
X-Received: by 10.223.184.88 with SMTP id u24mr490245wrf.3.1519151122155;
	Tue, 20 Feb 2018 10:25:22 -0800 (PST)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	74sm27607284wmf.38.2018.02.20.10.25.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:25:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <715fd4d5-13b8-2cbe-9f9d-545c56302933@amsat.org>
Date: Tue, 20 Feb 2018 15:25:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [PATCH 10/19] include/hw/or-irq.h: Add missing
 include guard
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Q6d4Bur//Rb

On 02/20/2018 03:03 PM, Peter Maydell wrote:
> The or-irq.h header file is missing the customary guard against
> multiple inclusion, which means compilation fails if it gets
> included twice. Fix the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/or-irq.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
> index fd900fcf19..3f6fc1b58a 100644
> --- a/include/hw/or-irq.h
> +++ b/include/hw/or-irq.h
> @@ -22,6 +22,9 @@
>   * THE SOFTWARE.
>   */
>  
> +#ifndef HW_OR_IRQ_H
> +#define HW_OR_IRQ_H
> +
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
> @@ -41,3 +44,5 @@ struct OrIRQState {
>      bool levels[MAX_OR_LINES];
>      uint16_t num_lines;
>  };
> +
> +#endif
> 
