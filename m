Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6072858wrt;
        Wed, 3 Oct 2018 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61aFEvNBISssVq6UCOT5SIfFNWGZwqBNkcQrZiiLsPOcMXAx7eZsf2ImnW7LKFl+B/hc+Xt
X-Received: by 2002:a37:411:: with SMTP id 17-v6mr419657qke.68.1538558906613;
        Wed, 03 Oct 2018 02:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538558906; cv=none;
        d=google.com; s=arc-20160816;
        b=tos9t43kkqqd556Gye7YBmXsg3NxNMYaE9NP3WUJT1d6JamEyqPKZ2xDw/rV0oGABW
         SP8jxDR95qTpUhm8hV2b89Unt6MzgDDsYpoCN1TPNHd8RMtl5HWNwX5Wxi5uKehopAwf
         RYBAsE1QWLHI9PaJF96ySs4Wza+As0/VE6FzSibBAiBKL6tNK1DlCRcBMRWaghxAqTpc
         iRuYQfMlZo50iRjXrATiSEE5SQs8NM04dK6oCC8SCJdM91YOY3i9o75bwIGfMxCEZakS
         g7gfGt4M0Wo0veLxUtJiu8KQyzW0ogSJ6c4ERwBmUZWjlqrHLugqtO6+EIZKY7Lix0GH
         Q3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=kzqPCUHZEpnL8C3+69Y7HmTKkswDzIEaWVN3qu9lOWE=;
        b=PA+svyQGQuvZTE6LOrCbVNaPVGdPp2T20SKg2ZblAcLVYZBHvNv/3v/uAwCdt7BcOJ
         9v113j7V/f2Dfk5m1+cA8aKpbkXY/p2oXhFH/fgrqdhi4rkMtDclKMeXQDoBkV/4TUVz
         tUq84shpEcym+HIM0UpWriMsJzq7emA9AoJ83u3K2BiHTJCkh4L7ImgU2V0wXOd2AobT
         oqKk7BBfs7GNyBqM7qIL6fzcWIs0wbZLhu/XShNB4I1uxhuyMmQa7D/IRCfqQSu0UpfI
         k8qTypu/rbNl25hCPjR5e6B8xj4107HCZw56PKADH7lQa1X31/qw7+iNFPoiuZytUIGE
         GKfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u41-v6si517931qvc.146.2018.10.03.02.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 02:28:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7dSD-0004kv-Os
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 05:28:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7dRm-000362-Hy
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7dK7-0000BE-0Z
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:20:06 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7dK6-0000Aw-OT
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 05:20:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id e4-v6so5292822wrs.0
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 02:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kzqPCUHZEpnL8C3+69Y7HmTKkswDzIEaWVN3qu9lOWE=;
	b=K2YDzY/GISDrbDO2Vjps6rrTHQPBICfrl/JZUoPdD/vlcmR/Axhixh38tsezxWtogN
	lvnOFEaHixIogmO1Xj2Z/pVXBATZWpOb0G44j0J9pHnb8jAPNbWzIETDd3xquZno4QD3
	2Aoodboy0SB8uQrKor3OeLj3kMiKpOXTdDHePU7kUkKlnoMH+i4XHEXjl9ozK+Kkj24C
	Wjr0PcPL42htYut6cOSjsqE5XoJoNs71oUxEqX5BEoOUgGjrb83xxFfzH65ouOcJumWy
	n4BD4WF43//e2Z+qCSn5t9zOCt7BFHRbWlPzkgOwIxrdhccLuLxXEa19D4JtamlS+nJN
	E0WQ==
X-Gm-Message-State: ABuFfohi36tHg498nxaF/VX2OOUciiJRdK5hjpaZ7HXpd64sDuVhwxmN
	ii6Eh2HBSgeWzxocZ503F/0fYQ==
X-Received: by 2002:a5d:6707:: with SMTP id o7-v6mr548672wru.326.1538558401687;
	Wed, 03 Oct 2018 02:20:01 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	e64-v6sm1154468wmg.0.2018.10.03.02.20.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 02:20:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d82eb933-48c7-25b9-9948-cf0354e27813@redhat.com>
Date: Wed, 3 Oct 2018 11:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/13] target/arm: Add v8M stack
 checks for Thumb push/pop
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzQYsVr3zPM1

On 02/10/2018 18:35, Peter Maydell wrote:
> Add v8M stack checks for the 16-bit Thumb push/pop
> encodings: STMDB, STMFD, LDM, LDMIA, LDMFD.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 65df8d6975c..ef64d2559de 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12251,7 +12251,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>              store_reg(s, rd, tmp);
>              break;
>          case 4: case 5: case 0xc: case 0xd:
> -            /* push/pop */
> +            /*
> +             * 0b1011_x10x_xxxx_xxxx
> +             *  - push/pop
> +             */
>              addr = load_reg(s, 13);
>              if (insn & (1 << 8))
>                  offset = 4;
> @@ -12264,6 +12267,17 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>              if ((insn & (1 << 11)) == 0) {
>                  tcg_gen_addi_i32(addr, addr, -offset);
>              }
> +
> +            if (s->v8m_stackcheck) {
> +                /*
> +                 * Here 'addr' is the lower of "old SP" and "new SP";
> +                 * if this is a pop that starts below the limit and ends
> +                 * above it, it is UNKNOWN whether the limit check triggers;
> +                 * we choose to trigger.
> +                 */
> +                gen_helper_v8m_stackcheck(cpu_env, addr);
> +            }
> +
>              for (i = 0; i < 8; i++) {
>                  if (insn & (1 << i)) {
>                      if (insn & (1 << 11)) {
> 
