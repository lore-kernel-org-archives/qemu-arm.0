Received: by 10.25.21.156 with SMTP id 28csp52546lfv;
        Thu, 11 Aug 2016 03:33:13 -0700 (PDT)
X-Received: by 10.55.27.106 with SMTP id b103mr9494854qkb.224.1470911593156;
        Thu, 11 Aug 2016 03:33:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si1182525qkl.34.2016.08.11.03.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnIW-0008BZ-DU
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnDi-0003Ul-82
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnDg-0008N0-5n
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:28:13 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnDg-0008Mp-0w
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:28:12 -0400
Received: by mail-ua0-x22f.google.com with SMTP id k90so112992563uak.1
	for <qemu-devel@nongnu.org>; Thu, 11 Aug 2016 03:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VTPP7jtbKhHbEM7HoEd3nxDyryvSAm0v8LoPOemJ7Ug=;
	b=a/MreEWZqzOczZSYlksCqP2Oq8aSJ/uQbn3mbez0Bq0larVMmX1G9mWgjo6KLLMi92
	6ObAwz9WlpOZhFc/qWTP6Tm3GeJhXOY551Kd8VYE/HZ4PWchdnaVlMIWQ/Nc2w8sN6+M
	vckMJYYJ0UIeboISHoCvoKBQnVq11ldc5w2CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VTPP7jtbKhHbEM7HoEd3nxDyryvSAm0v8LoPOemJ7Ug=;
	b=GHjXLd1944Ko5Wv7QRMrNab0N4w3knSRaIa6LmuBJ0wLEqDmjH5y43/rVmblYg15g0
	ZyrIp/2Sev6iRs69bBd5K+LB4Y/9DJKXe0LRmT0ClU1Y0ou2bQ1ydRTWIOJwL9RKT8mw
	dlxRygppmDh7jf/ydCvEptE/izEquA0PZD44eDxBEesb2XUmf9HbOBoybnrwVM7GFF/g
	dxvUx5OPoqQb4TQ6g7s45+MmMsOCwrLFxTVdjVop6pPJzU5ULIszxrW+6xWUrwFmvOSe
	7jCPbg9jZp7H2W9xHjdolt8xrOGYp/Y9J+Ie12WfIf7wru0nuF2gHXblLtDV1N0pqAdX
	+uvg==
X-Gm-Message-State: AEkooussJ3mYlM2PUoy+K5dH2KwTnHgLjW+7zeADs0qmbTTANN+s9ZV5eCWcwTQ1MyN+T0v0+ON0Zjme42PogRfe
X-Received: by 10.176.0.212 with SMTP id 78mr3683729uaj.107.1470911291582;
	Thu, 11 Aug 2016 03:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:27:51 -0700 (PDT)
In-Reply-To: <1470158147-16378-7-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-7-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:27:51 +0100
Message-ID: <CAFEAcA_V6k5mZGQfL2WMqZmzXyHuPm0ovdt7hr2xuBZWdaRtYw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-devel] [PATCH v3 06/10] palmetto-bmc: add board specific
 configuration
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1krM3ZXIYZ8W

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> aspeed_board_init() now uses a board identifier to customize some values
> specific to the board.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v2:
>
>  - removed silicon-rev and cpu-model. This is now in the SoC.
>
>  Changes since v1:
>
>  - changed aspeed_init() prototype to use a 'const AspeedBoardConfig *'
>  - fixed white space issues
>
>  hw/arm/aspeed.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ad0a062b5624..4226b8dcd95c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -30,6 +30,19 @@ typedef struct AspeedBoardState {
>      MemoryRegion ram;
>  } AspeedBoardState;
>
> +typedef struct AspeedBoardConfig {
> +    const char *soc_name;
> +    uint32_t hw_strap1;
> +} AspeedBoardConfig;
> +
> +enum {
> +    PALMETTO_BMC

Since you need to respin this set anyway, I shall pick a nit:
a trailing comma here would be preferable because then you
don't need to change the line when you add the next entry
to the enum.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
