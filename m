Received: by 10.80.166.35 with SMTP id d32csp511740edc;
        Wed, 12 Oct 2016 05:44:42 -0700 (PDT)
X-Received: by 10.200.56.67 with SMTP id r3mr922413qtb.120.1476276282070;
        Wed, 12 Oct 2016 05:44:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s13si3745980qtc.86.2016.10.12.05.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 05:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buItl-0004fZ-FN
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 08:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIrn-0003WM-4Z
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIrl-0006gS-87
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:42:38 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIrl-0006gH-49
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:42:37 -0400
Received: by mail-vk0-x234.google.com with SMTP id b186so45430523vkb.1
	for <qemu-devel@nongnu.org>; Wed, 12 Oct 2016 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MgvfE6BlW3POOxcsA1x4ONaQOuk1vhiXWviDaCZv8UM=;
	b=hsHksaVjgh7YGo//09OUOaI8dTGSVwx5BJuSqF+60OlR2lcHPD5P84pzVhrKvZjKAs
	IW5AHvm/HO7fwAcE0NtVQohQKGFDQAiIl7SuG0pKCHA3wL/UXpnpOIIIwRHff2zUawpc
	nFMWe9whubmKUEnd14sQgbkbyrEbxnilnOdrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MgvfE6BlW3POOxcsA1x4ONaQOuk1vhiXWviDaCZv8UM=;
	b=S2ANUcNUZGAdJg+iheRqNRMLPsPxCKMv6fkdrNsdukx1OAPXHTwfEyCH9JQFlOBDcB
	obJGR5hqzcher2M+1VQsdSYMMS8BVgnGe7Zq/Wyx1OVXiCnAW0KSKNW998AxQvGG9GCm
	d5imw7MZHhorMmJqoJNEkZxETPQX7ECiMuM2n2m+6z3ofvgU26ogP5ciIW8gX9XGmRot
	O/mTA6BX22gQvMeoO8E0j5CznuWD1zwpsV7k9l0zhksQ1I5TVRfewiI+OupBmoR9Iaca
	elG6+BAd/gdJkquc6JV9NJQCndzRbqzqYz6aKgB/XFx1oy/WvUJQ8niZliaN9TtciLjE
	8yGA==
X-Gm-Message-State: AA6/9RkNiQ8vjHj9KXCxhHzTVlQYijRzbxeeaNJ94lMNdBnByz17tlOyMRcwLmXZY8VsPxUdOXeOv8QOzOygMqhB
X-Received: by 10.31.165.74 with SMTP id o71mr409461vke.95.1476276156446; Wed,
	12 Oct 2016 05:42:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 05:42:15 -0700 (PDT)
In-Reply-To: <1475787271-28794-1-git-send-email-clg@kaod.org>
References: <1475787271-28794-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 13:42:15 +0100
Message-ID: <CAFEAcA8RyVxFQa2X6m=G24NKAi++-PaiaE5Om07h2DnE3UnovQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-devel] [PATCH v5] tests: add a m25p80 test
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BUbnSeRZGm38

On 6 October 2016 at 21:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This test uses the palmetto platform and the Aspeed SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Brainstormed-with: Greg Kurz <groug@kaod.org>
> ---
>

Applied to target-arm.next, thanks.

-- PMM
