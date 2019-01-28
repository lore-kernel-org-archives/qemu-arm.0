Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3155124wrt;
        Mon, 28 Jan 2019 03:16:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5tuQQk1T6oNJEqiP88wO78AL5CK55td7tD2W8e8vDIZEps7Qm4u8gzpliUqFcvtZgJLocl
X-Received: by 2002:adf:fc09:: with SMTP id i9mr20493657wrr.299.1548674188948;
        Mon, 28 Jan 2019 03:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674188; cv=none;
        d=google.com; s=arc-20160816;
        b=ROFBKsd2ZV5G2roRTmI0dF8f4O9Aa7Wr8AWRcjMFudjh16lKgwvW4WOh3p9geylQ/6
         6J95uQcJfcxMUXp1Q+lN+mwcczC1fKNE3WXe+5vZ3fx07qTjHREoWDB9hFMzDQUAC7iv
         HmhS2mAzNlVQRCN5nQ1lF8W583c6FCA7FCFJ+JOyOj+cG49pR0B7xrThOlwJZSP7iE47
         vwDueXFMnqyCtilIakjcnQP9hdDSyME4pOwmhuNN8Zd6S3NMde2Nu0uK/LHeIRYf86+8
         mh+6QbFHr1NRyuOvAZX7I0YXcnZ84Qhn3XxuHGQBiTvdK00/fBdavoPQaYi67rc+xgkX
         qn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UwjE/wyKeleNxUUeX/VwWIafpBJpZcNxZh5TQDD8ikg=;
        b=d80Z8nJK4DTGjymU2DTCRHilyRIj7F9pnMJzcoc6vCiyEwFAGREq0HgUbIrRgoscrm
         pJ2nbxBhsW2yA6vQzzXG0bSy+/FmUkxKDfiltpfY2ItORCOIOm9TLFSU5mO5+jMXXoAS
         aw0x3BrrflTWIUewywpNSIA3DJW4HESX5VnitHKsY15SCa2nzY7ENlWQa22cGHX1KVHK
         7b5IF+NgIYFoREjga1n2xgFqrecJHxFxCxDPO9xMnIHfEuYE3n3t48S1otLq/vgxbWMs
         ToQqpi0LAhcSqq7aOvihOf09xO/L61I9uLW0aV8CMQSnZuo6COYN8lJ7Pzsu1Gqcsq+l
         xs0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LzIOoQ41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si80538060wrq.38.2019.01.28.03.16.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LzIOoQ41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4tw-0002fb-19
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4tl-0002eg-FQ
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4tg-0008Fr-0J
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:16:17 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:55616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4tf-0008Fd-Ry; Mon, 28 Jan 2019 06:16:11 -0500
Received: by mail-it1-x144.google.com with SMTP id m62so19980964ith.5;
	Mon, 28 Jan 2019 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UwjE/wyKeleNxUUeX/VwWIafpBJpZcNxZh5TQDD8ikg=;
	b=LzIOoQ41c+gxsoj54CclK+lqia84L7js2sNlgYE5vuMYmZWJapoT6yozXqgHT0+fM6
	ZWcnVI4Tgv/v1IrgM/S0PGQQKjYIdCY/jE/zy4JyI9SSq6J7LfIKHQD+Go4kAbXyfBdT
	12OaTOowi1IaINuDSZpaLAHOqeaEw6Gn85+iJc1bhbcWK2tF7e8W+jufKKpAwqgUWlvw
	7OcOSdsGA866dER26PP4AnJly6pnakmEQdyU9kgNWRRCCHCJCTX+99C3Day0j8creylq
	PjclU2fYQvn0l6UuRQIqNX6U+P5P8zSxFa1anQoxuPnm9HRBHLNchKK5mQTV0v8OWGCq
	Y2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UwjE/wyKeleNxUUeX/VwWIafpBJpZcNxZh5TQDD8ikg=;
	b=RFQMjDADEGvfK8ncuvTvziV4phlKPa2o3ah+Zx6MDZQQ6v0SQ0qvhcI+J6ozG74IBU
	BeJcW3KyPapgy96UMZUTOGelsRRWw6pN353RAzjzfesEpPERUSRZrfr5lDTfNqgGZ9Dm
	I7rhMNbS+jy88zdEYhuzK1JqAVa0BNqOSZEmSdom/jCqD9EskR5FS0/4M/5X7zhu7Euq
	V7A0Zc74WrWOI48hdwVEbug3sZPX20gUN1UOs5LhG00SByRYayGi9MrCCqf1JhMTmtSp
	1Pd3QSW8aqtrb6J5aKbfaqFW9eR5zrUtM7tYHr7JbMrBHxHfwMKstDv5yNChvjDeEAKz
	KrMw==
X-Gm-Message-State: AJcUukeEarU83J9enNjEzkz+yepxdk7tm3pgAPmQld4jv0XFa8CPWtRj
	fjflCu+BEZOvP69dgi+YtPmouVM5jz+CfxLcVIQ=
X-Received: by 2002:a24:4293:: with SMTP id i141mr9075535itb.5.1548674170840; 
	Mon, 28 Jan 2019 03:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-6-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-6-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:16:21 +0100
Message-ID: <CABoDooO-8HDMU6u_+JZHJRSvSCNp6bWewVoorX8_ekDRsyqtew@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH 5/7] target/arm/translate-a64: Don't
 underdecode add/sub extended register
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jY8RH6MZ1AIF

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the "add/subtract (extended register)" encoding group, the "opt"
> field in bits [23:22] must be zero. Correctly UNDEF the unallocated
> encodings where this field is not zero.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 2cade64ed25..efd2f6490b5 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -4204,12 +4204,13 @@ static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
>      bool setflags = extract32(insn, 29, 1);
>      bool sub_op = extract32(insn, 30, 1);
>      bool sf = extract32(insn, 31, 1);
> +    bool opt = extract32(insn, 22, 2);

I'd prefer an int to a bool.

Otherwise:

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

>      TCGv_i64 tcg_rm, tcg_rn; /* temps */
>      TCGv_i64 tcg_rd;
>      TCGv_i64 tcg_result;
>
> -    if (imm3 > 4) {
> +    if (imm3 > 4 || opt != 0) {
>          unallocated_encoding(s);
>          return;
>      }
> --
> 2.20.1
>
