Received: by 10.223.150.237 with SMTP id u100csp66352wrb;
        Fri, 10 Nov 2017 15:11:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb9/iiJ36c8iytg4Zdi94MzHqU/N4Y3ikky8yJblrGyMUtxRCQa9ffUUF2e37IlQyKdKZgd
X-Received: by 10.37.13.129 with SMTP id 123mr1175853ybn.416.1510355501989;
        Fri, 10 Nov 2017 15:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510355501; cv=none;
        d=google.com; s=arc-20160816;
        b=iUyNhbjvj7Xtzy78ALcpM/GxK10TBrNtlpnIcWrPCrOMrIyBQhbHXtBhLz6DYv/S7L
         4IYxmJ8MPg6YWCjL7H6LM/dk5LO/7CjuAHi+OCj7hUfewODO7ZA/jql8BCcNlaPJp0Rn
         44BgWSnaTemUg+pJtVcqtciLKr2GawAIZb/bUHT1XAko3EoBgaahU8a4LYfweFcCzPo8
         oxWIGzhYBgpXPpm3DimibouJS3hHn8Xo68VeqhU2Jhql2SxsNpoXDcfazXPPAhgCcO7o
         a9j36w5UhAr5v0P75l7bt3UBeiUwNTF+5/L0w3foS00KdJsRu5lBtnU80CoSDwPhwowI
         Eskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rLg0hdzhQqMAsZ2luw7OpXRtnG3EH2yD8eRloHWeSmQ=;
        b=RIy8mGPXYZqjKN4N6wWKNZGLAsCWzaZRGA0N/AprGuRu9HJKmu7PE7XJjuSIdnBtCE
         6h5pakDrAp1A5Wxcpqq2tHV+2nV5E2nxL4lj94dTGBRoPrAHTUqc0JTy1lQICtRhHVFi
         ROftkInxbqKL+IuVaMVqQ+MJOmQnw1yfPOEWGnwmpGTMd2fIzdzO7FR2qPS3e0SpaKB5
         wVvTKLqyWb/MUgptHF0ufh4ms4XEyqmPZcpjDvFF5LuFcJmE5Q4YCOekrLNFU/CYkshQ
         z7LJ4qEaKxiqgx/aYvZ1ArQ1KVSKhX3eHPcPbShbF1gZfil54eTAAfWlX/PWQgK0NHv0
         rUJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fGGd1yl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n62si665080ywe.544.2017.11.10.15.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 15:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fGGd1yl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDISb-00065H-CM
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 18:11:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDISR-00061v-Po
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 18:11:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDISQ-0004ul-W6
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 18:11:31 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:51225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eDISO-0004t0-Rq; Fri, 10 Nov 2017 18:11:28 -0500
Received: by mail-wr0-x244.google.com with SMTP id j15so9820145wre.8;
	Fri, 10 Nov 2017 15:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=rLg0hdzhQqMAsZ2luw7OpXRtnG3EH2yD8eRloHWeSmQ=;
	b=fGGd1yl3kinRRG0JWtYuDhcL7744tCIj2XiiJTcioCdIxGnSLenfMe+exh9qH2xSGS
	nXilZoC8xVpw4mP6GHgamn0Cb0Zh7VqO90OYi5wmlUyHaOcBjl10jTqmRwgoag0mDUNH
	3OjhQXK7yvRMAXn/yUlggO5qN0FumM1aqNyXpHEk/+GcfdmpQUHtS9pl4MG8CqoUFFfy
	6nC9W+UKrM+FwIBOciMfGfDUkZohSXzXQuZLosKpxeVI2cTuFUQvYRnX73j+VAsAUiGL
	rEXCFpbusGSkWyddAp9mQatP1/+p8NEUYgtxNcivn4JeKULGLgVktTQxt/LwHgymkhyL
	vkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=rLg0hdzhQqMAsZ2luw7OpXRtnG3EH2yD8eRloHWeSmQ=;
	b=STdCR++z50oc/4wIS8Iw/NchPiyVVfEvW5sRPhWL4aelpUvVkXat22dxAWhpYuAP9G
	f8uo9j+T7KXwr6WdHDgZTfZO94e6pYH1u85Bx0MjuNg8gVCcKQRgD3PNxJzZlCVeTn5A
	+GaQ4XtPksAO5hZGgBgUOg12a6qUKB+jT3z8HJfBrAJx5YHo6xLxyz6MJbUsXttg8fHk
	rLcZo/pVp2a51o5DZiz+tgH2MkvP7WtjFFmAWFgRjm7EdYWyMPIK7U7SNYdukLifRQcj
	ytB7O4boFy5bGBAoAbkH8fY9X+jyEf8rF1U844AhnCT++fGoyIvWRUXDqpFceuU3quRc
	J1Sw==
X-Gm-Message-State: AJaThX7AfC5fqTv93gIm9glaphIkZ6Yl9a/qosctJEjyqbP2+Npq9CYl
	nSZJyOX3yF5xvgFJwRdtVu4N75cERURgdpCpukI=
X-Received: by 10.223.139.8 with SMTP id n8mr1356645wra.225.1510355487554;
	Fri, 10 Nov 2017 15:11:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Fri, 10 Nov 2017 15:10:56 -0800 (PST)
In-Reply-To: <1510343626-25861-5-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-5-git-send-email-cota@braap.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Nov 2017 15:10:56 -0800
X-Google-Sender-Auth: PXsH-7TSCh7gguVeae4xp5K2WPg
Message-ID: <CAKmqyKPGafyXee3t+TX+vWkDvnwDJF661V82dx9yj_9DWRpV0Q@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.11 4/5] xlnx-zcu102:
 Specify the max number of CPUs for the EP108
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6/XfgnlqlP2

On Fri, Nov 10, 2017 at 11:53 AM, Emilio G. Cota <cota@braap.org> wrote:
> Just like the zcu102, the ep108 can instantiate several CPUs.
>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

I completely missed this, thanks for the patch.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xlnx-zcu102.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index adddd23..190eb69 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -188,6 +188,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
>  }
>
>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> --
> 2.7.4
>
>
