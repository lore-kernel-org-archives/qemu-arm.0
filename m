Received: by 10.223.197.9 with SMTP id q9csp1686332wrf;
        Fri, 6 Oct 2017 07:04:46 -0700 (PDT)
X-Received: by 10.129.57.196 with SMTP id g187mr1679866ywa.35.1507298685980;
        Fri, 06 Oct 2017 07:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507298685; cv=none;
        d=google.com; s=arc-20160816;
        b=jNrJWu/6IJVVLjNrg0qvBH80GM/TzACpzHXpmlFA3fK2u29vIvqtjnu6ZR+BbM3Wxp
         XcAddOh/n7lqqhYFVYx+Z8jLO/eOGW1crurIX2wl9A9zeayzlr9Dc+JJ1nVblQJlAjkE
         3PQz7fa0ptdHO7cPaEdjZi6eHMH0Q2vgShFOomSeymOnocTCXKlX2kGQEDUiOMJqjJ+6
         Uo6cs2gW72pljDGkxLb1WMlg5a9ZfSllbaq+URcb7fSGtVGVsxv3YEwkHwGmLX+FWXcE
         GCOR0/b1xDDaYmdQU2j82yNjYAroVXcD0Rbme+Jgt4Xzhvtybj+QQsCi/Un+jqg4Ih/7
         ClVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=576+s7JAPk1BEvPdZWhISEckYDYS+vcB7weSEwKB33E=;
        b=Fx+Hwgsrg6XMuB96640/+XVSWip6+otdNxVfpJG8byn9P6r3GJ95snUvGzuZru+6Sn
         mt3SJtEEXZSAIPkpBf8oDBCftTPoVzyLdaboUBu8kXGbX9DnOprnmeD3YaUzv+3qmko9
         BdVlCAd31AjJxobimNouAzXFUwB/hekIpoxCYeIlIYJ17YSEGMbilbXmhppn7eSiNYIQ
         gW90lCgUilsYC6pU26XWY/QFu/HuxGPeE16M6m47KcrJphhCqgKAhtvcqxcrUiMsHYTF
         a2MuYw9ANiIDaAg63iLHDLl/B7JebrFB5B5eovGTxHLvrqoABYrxYicyLVowxd4YPP64
         6xVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXFOYFUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r64si406117qkb.215.2017.10.06.07.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXFOYFUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TF7-00050N-Du
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:04:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TE5-0004LL-KB
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TDz-0001mm-Pg
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:03:41 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:53136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TDz-0001l6-Jo
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:03:35 -0400
Received: by mail-wm0-x22b.google.com with SMTP id k4so8151493wmc.1
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=576+s7JAPk1BEvPdZWhISEckYDYS+vcB7weSEwKB33E=;
	b=fXFOYFUinAY2wKAV51ouXjksiTP/wTqLa6VyPCeBxXQ8RcuNpFPknT0Zr5QPIBd032
	b6DWVCJpBBFvHCDMhz09+ejZQj9ystoBaum2yAhmhPyzOd7wPVEtv1dmOxa3cwC+V4LA
	kzyM5aI6NmXGAXkuJyWidmDa2bbK0nGL3EHxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=576+s7JAPk1BEvPdZWhISEckYDYS+vcB7weSEwKB33E=;
	b=M3CxofZztuUmbaEIOyJltnDUQMcRUCw2RLQX4DRnoK4+0Dl/FkmM2dHXbOOXd/fgsM
	1oIGqa8vzrGXkiKsRfC4uLnuWdiCcGXtSi+AlR2qAts9kowDZRJaX/JrdO5atvvtKHXq
	Bp8F2oJTNkIB7ehu8jKjtNU7c8iBeZkTq5TjPkYgCmy+I3f+qJ4jIWPzpre2PqVnfmc7
	6Hqiaavuo/n3xE+R73PP4yKbCCJWNFGRupZ0CYUpCB3WxM/DZYjA70TAxZzCgrlDNRTl
	HCgSG4pvGydVBYmRNIH9rCPv/wATsjjTGMQHXtERPQDla5SXpjgm8nTTdgPVtf6v54XN
	nQLw==
X-Gm-Message-State: AMCzsaW8YarsjwVrSxUxG873fcA+RBcaQRDKhxfJPpUBwwMbqTxuLNSe
	heVfSvWtrJgOVBGV+fdCYaVY1mtSG/LoxcdGuS3pUg==
X-Google-Smtp-Source: AOwi7QDKVION/DCT9ugb1GXrgQ8cdr2DsQUXP/ZW7cKrFlupQRKEyR7CQMrIOiwsmE6AiAfmTCzCQAkXoC13HPdvwM0=
X-Received: by 10.28.113.196 with SMTP id d65mr1758002wmi.151.1507298614502;
	Fri, 06 Oct 2017 07:03:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:03:13 -0700 (PDT)
In-Reply-To: <20170918195100.17593-6-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-6-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:03:13 +0100
Message-ID: <CAFEAcA-FQxm-EXRk_GGuazaNgoRon4E=EMfdEEH_Xwh-5v1S-g@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH 05/17] imx_fec: Use ENET_FTRL to determine
 truncation length
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I1a+sGoP8itW

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Frame truncation length, TRUNC_FL, is determined by the contents of
> ENET_FTRL register, so convert the code to use it instead of a
> hardcoded constant.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 767402909d..989c11be5f 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1050,8 +1050,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>      size += 4;
>
>      /* Huge frames are truncted.  */
> -    if (size > ENET_MAX_FRAME_SIZE) {
> -        size = ENET_MAX_FRAME_SIZE;
> +    if (size > s->regs[ENET_FTRL]) {
> +        size = s->regs[ENET_FTRL];
>          flags |= ENET_BD_TR | ENET_BD_LG;
>      }

PS: since you're editing this bit of code anyway, can you fix
the typo in the comment in passing: should be "truncated".

thanks
-- PMM
