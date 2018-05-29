Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3554313wre;
        Tue, 29 May 2018 06:12:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIMMhx9zkSOBzTvhOywWsM3N8qM0PoYiDfXtz4o/s8D4aAVDJSeGGt+dETDdqixuWgVwywO
X-Received: by 2002:ac8:27ce:: with SMTP id x14-v6mr15393782qtx.171.1527599543535;
        Tue, 29 May 2018 06:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527599543; cv=none;
        d=google.com; s=arc-20160816;
        b=CNZKjb+WCgetaNwNBenKo3sIs1siBjQelNoJwJ3XRtCWveajPjtTgyilmuKxt4UQwM
         qcxPkTeBtPF6sBchT5tzjmxPtZ+TV7rNWP9uAssbQJUMndN6gOjmzpSTloFG8CFV7Pu6
         F9bbDdgFz/pDKN4hBfqkjLO7q5O7T93xGTVS6/kMO08K/U8y9RKcAy2A8BJ35slRw8cq
         OXX94e6VF914ILrEGnfnlFviaeGM5+mGjgk3OJAijcLuru5HFUxhtTImLD/K7oEtYkdL
         O0Va44cDFeD1JqwYZkEdsoEiXUIwBnqbtI8cY2VAnSPfXuNTxQgXBoUFynN8e0C6++8Q
         CcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=lRtzBqJqborxuyBdnxUNHYi+vpKOA7Asuy8wr/kCFME=;
        b=kWbHztbmdKUMWSRI6cToMwsx6ChCBkyC/59PCwqb3ueLSm8n19J3ujTPBV/NjMBIVH
         nr2+UJr+IwNtW6bNlB0iAeU4LqcqNGIf2OWjdLat6ogTlMIj5XGW5zgJsze8raPcITpr
         AZ5C3Iq9QiAPXkwJXUvKEdQR/AyiW+mftCA6ikolhPzAHuiimO4CfotiX8PwXLI5XQ+f
         PizRSsvuJ9RqTCIXjKv+iPBTukKylQDiVPHtVYYMOvyweleestkIUEUV14EUiB0u8qGg
         vXnrP28OliCEQBR8ACMcujpoEu4EDqxW+da4dor9te4vtaPOKei5GFcXgzCR0M15SeTE
         F7rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjMW3rqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38-v6si19245874qvp.133.2018.05.29.06.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjMW3rqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNeQJ-0008Jw-0u
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeQ5-0008G2-Ay
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeQ4-0006pF-CN
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:12:09 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNePz-0006he-2A; Tue, 29 May 2018 09:12:03 -0400
Received: by mail-qk0-x244.google.com with SMTP id j12-v6so8032793qkk.4;
	Tue, 29 May 2018 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lRtzBqJqborxuyBdnxUNHYi+vpKOA7Asuy8wr/kCFME=;
	b=PjMW3rqZRreBVhiLiztAplAWZUAD3+WPExnhJgfe86pWF/0a8aPRa4VnrSlk5C53bd
	oQzmpcDdI66w66tEXduoVSWIQVyTccwCmyFfPVHxhGfo9xabNAXcNG+sGR/HWa68Xk2M
	6RsQIeU/uhxoOjauRwraWMWkEWqpJWNG5AggkWeHWK5OEvziadgfHskbhi9GAExQJ/gR
	HUnQCLJotNRCQ9FIpfknmyCxzYJnQ6PdQE0BIL5tpL/qt2fTDHAMy5DHvfh+IF4lI5hA
	fBEHO09xXlfDpqk+KM2c6GYc1q/7YUNLq/YhwdVq43oYNDe6yPDcXZNstUcK2nl8HPLE
	2yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lRtzBqJqborxuyBdnxUNHYi+vpKOA7Asuy8wr/kCFME=;
	b=TknZ2kj2jnRl/bIcBvOdWtvHArcBkmlLLR0nYJpBRmfEKYtJ8aK/rvjEWbXZMK2iu7
	x/ai6C0CEm9G8weDzMs13dT30CWKPHBL5kmAexgaJIhBORVZCqiVEDEbwyrQIvo/W/Dv
	4eWFelPtKk9azwuoflLz4DzxLT9l0sNXrmzAdEiuqdRxqnKep8gUKcMsXNtOP7CWe0TS
	Eeox5PrZAMMH9pueX5fNoUc+KMFoI8s8mVAUIo6fOY5jIaZCgI7Jbq8daZzAo0vcWqDp
	m1WTjoFDMiBS5YS6+2c29YSpC5DlP2qkjPPvrxoVAhxnm4jXsLe37kMclElKyu1XPXFk
	3bsg==
X-Gm-Message-State: ALKqPweKKcd1EatWS2ixMsO0qR7EH/bi/K0DqHyz7+3WZJR8qbQUjKYR
	q9ktT47/DoqIqTKWfjDJaZN8E7fWhug=
X-Received: by 2002:a37:ab04:: with SMTP id
	u4-v6mr14340223qke.92.1527599522439; 
	Tue, 29 May 2018 06:12:02 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f8-v6sm1971937qkm.42.2018.05.29.06.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 06:12:01 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <48fac48c-168d-70b6-5020-1faac584804e@amsat.org>
Date: Tue, 29 May 2018 10:11:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-6-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] slirp/ncsi: add a "Get
 Parameter" response
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRwAFbna3NiL

Hi Cédric,

In title: "Get Parameters" (plural)

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> This is a minimum response to exercise the kernel.

This type is mandatory in DMTF Standard v1.0.1 indeed (DSP0222).

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  slirp/ncsi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/slirp/ncsi.c b/slirp/ncsi.c
> index 02d0e9def3e8..f00253641ea4 100644
> --- a/slirp/ncsi.c
> +++ b/slirp/ncsi.c
> @@ -35,6 +35,27 @@ static int ncsi_rsp_handler_gls(struct ncsi_rsp_pkt_hdr *rnh)
>      return 0;
>  }
>  
> +/* Get Parameter */

"Parameters"

> +static int ncsi_rsp_handler_gp(struct ncsi_rsp_pkt_hdr *rnh)
> +{
> +    struct ncsi_rsp_gp_pkt *rsp = (struct ncsi_rsp_gp_pkt *) rnh;
> +
> +    rsp->mac_cnt = 0x0;

"MAC Address Count: The number of MAC addresses supported by the channel"

0 means "no [MAC Address] filter [in use]"

> +    rsp->mac_enable = 0x0;

"MAC Address Flags: all [MAC Address filters] disabled" ...

> +
> +    /* TODO: provide the guest configured MAC */
> +    rsp->mac[0] = 0xaa;
> +    rsp->mac[1] = 0xbb;
> +    rsp->mac[2] = 0xcc;
> +    rsp->mac[3] = 0xdd;
> +    rsp->mac[4] = 0xee;
> +    rsp->mac[5] = 0xff;

So there is no need to set this filter,
or you have to set:

    rsp->mac_cnt = 1;
    rsp->mac_enable = 1 << 0;

Also, you forgot to set:

    rsp->vlan_cnt = 0;
    rsp->vlan_enable = 0;

> +
> +    /* more data follows */
> +
> +    return 0;
> +}
> +
>  static const struct ncsi_rsp_handler {
>          unsigned char   type;
>          int             payload;
> @@ -62,7 +83,7 @@ static const struct ncsi_rsp_handler {
>          { NCSI_PKT_RSP_SNFC,    4, NULL },
>          { NCSI_PKT_RSP_GVI,    40, NULL },
>          { NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc },
> -        { NCSI_PKT_RSP_GP,     -1, NULL },
> +        { NCSI_PKT_RSP_GP,     40, ncsi_rsp_handler_gp },
>          { NCSI_PKT_RSP_GCPS,  172, NULL },
>          { NCSI_PKT_RSP_GNS,   172, NULL },
>          { NCSI_PKT_RSP_GNPTS, 172, NULL },
> 
