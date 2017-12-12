Received: by 10.223.159.74 with SMTP id f10csp4089610wrg;
        Tue, 12 Dec 2017 09:35:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBouP5jG8g0sxjPsFa4nAU1cZQqAjj4YkPjOZkRij5Ib/wct2RawLH4KGY8J5bPu5sx1QNzBX
X-Received: by 10.37.4.200 with SMTP id 191mr3357612ybe.311.1513100147463;
        Tue, 12 Dec 2017 09:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513100147; cv=none;
        d=google.com; s=arc-20160816;
        b=qRxlmqoWJ3RaVz+TVzPQeqTdByNeUpGN4188nm+G6FkUORLE3KhRB/WicIyU7MbDzI
         ip0lBjqVSh9n++pvHO0SsVcKxFX8ZQX7idmMip8ShBtaxTGj4fZ8jpO23nUabSnbtBA4
         Hf9NT0VUe7fLslRvjyKCbDm05D1jbZ4LtcyG4KyqE+AjT2wDlljBv7nqvH8PFubJjPuO
         83yAAMmYIKJ5kwvh5YUmU20/X0i/87yD0GxqphFsfjkz0xJlRLmu4pj15pUYHhKVC8Ks
         8tC81bcn/N2ryhKBtKdp5aHXwXcWV6VUnHu7ZQ81AGuyMKhA2LipLCCsVUsype+8mWUx
         BRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=dJQMz3TdMxiIBPHPpy3VbHckaXspx5yPE0NzvBbPRtg=;
        b=elOzx5oyPdButFS0tch55bhX7ggAmVHfQITdNn8mPpAyiwHIqUvKqqcf4abWbsNII+
         DOA9ZRh+mTDLMZDe07N59rtrO8x7XiROJrWXjsemceKlJJ2RTgpX2G+Bi+io7SjXItgI
         l1BL8Mkvf4L5ne59yIJ+MslHl3YO2UTljg9dhj3N8ZiD+rzzozRISwmD7sq6d9Fj7sRu
         Mrjz6TCGAeIs9PPoPAkWx7UJA36+r8UywYZqrhZkX6ALtupGeZbifIiF7sCX8LtfqO7k
         YPWQUsmS6OwG90E4kA0eZMOTaTB5SxakkajpAMtGE5BEirR//Dj9RpGEI8GZVoh+QIMV
         k85A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXehf7B+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si2748964yba.712.2017.12.12.09.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:35:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXehf7B+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOoT4-0001fw-Ux
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:35:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoQ9-000847-IS
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoQ8-0002lW-Pu
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:32:45 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:33463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOoQ8-0002lK-KV
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 12:32:44 -0500
Received: by mail-ot0-x243.google.com with SMTP id h9so18483308oti.0
	for <qemu-devel@nongnu.org>; Tue, 12 Dec 2017 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dJQMz3TdMxiIBPHPpy3VbHckaXspx5yPE0NzvBbPRtg=;
	b=eXehf7B++IO2BdL94t+G0k7qRPP7iPiduFbhTUQNrn9xlTW4dWIvfANDO9pe95uPMO
	IkzeBjkY7ul63wZ1twy0vWpJODu6qHOZBcyQWO8d09v4lUWyhcXWrAJfbz2FNS/B0L93
	ii2WJp5EvDd9joO6PpxCLsusazqPIT2ma3G2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dJQMz3TdMxiIBPHPpy3VbHckaXspx5yPE0NzvBbPRtg=;
	b=NyJpelEWkg7RAf1Mlws8TAV6+n2yuSDza8kByGHejTWZrOT8NKUVdHJF0fgPoROR/F
	pTPgzm1X49666Q5J4xX07pWmj3DZHuTTQqVK+bzWmU5wxT46oE5mCFvkgeHIpabWVi/L
	BGG4z7Gs2tWVQZNsfmRdAM0/zA8d+wJjwq6cAmZAgRP/57z++PagV7cngZ56ywcgztSU
	7rZLIOjjlRJXgLkTFK7MT7QAvR8V8ickgKB5UKXp+TZ6dLW/fiYMnq56QYaw+gYB4gBC
	LVHxJDIgRsE+xQMQ6DNnPplb9g1cD1rYYZG+BdRlMI8OYB+tNDf++JkSobYORWXxbrfn
	oTAA==
X-Gm-Message-State: AKGB3mKCQsBCCgLJHIFLvxqJR78eJt6JBWeGxwGl66hC2NUw0lBOoJ0e
	Lj1kgDY/PYliQSp/A6bgH1wvgOyO0AkLZMdbdLSikg==
X-Received: by 10.157.49.54 with SMTP id e51mr3846496otc.24.1513099963705;
	Tue, 12 Dec 2017 09:32:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 09:32:23 -0800 (PST)
In-Reply-To: <20171211213007.7353-11-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-11-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 17:32:23 +0000
Message-ID: <CAFEAcA8CHzsFJ5kM8qZLA0NDqz_hv664+FF+_hMbjNPOmciKLg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH 10/13] imx_fec: Fix a typo in
 imx_enet_receive()
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1J5jfHu+jAk

On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com> wro=
te:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6cb9e2e20e..c1cf7f9c58 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1150,7 +1150,7 @@ static ssize_t imx_enet_receive(NetClientState *nc,=
 const uint8_t *buf,
>          size +=3D 2;
>      }
>
> -    /* Huge frames are truncted.  */
> +    /* Huge frames are truncated. */
>      if (size > s->regs[ENET_FTRL]) {
>          size =3D s->regs[ENET_FTRL];
>          flags |=3D ENET_BD_TR | ENET_BD_LG;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
