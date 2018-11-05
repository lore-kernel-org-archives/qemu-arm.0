Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2831817wro;
        Mon, 5 Nov 2018 09:08:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5dtgr5VvIE0KNyEG9PQslGqtZlhnUU7B8jw45wOIT82QVq+Q16STLsnn+FYTOyun2xEKJZd
X-Received: by 2002:ac8:246:: with SMTP id o6mr1454550qtg.0.1541437721072;
        Mon, 05 Nov 2018 09:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541437721; cv=none;
        d=google.com; s=arc-20160816;
        b=qDOywVhZz6sImTixTn/rtyZJhb9LkWuFRual559rehsEymMNk3582XURJ2OBBrgSpb
         iEuFNXP0vGeLqfRuBd96ALrwe4VangnR2Ht7PYaNOl/EvWwZJj0K/DQMj1p+iu9Byz6J
         3GsDEegnWPdPdHcAxO2ZNoqYiXQNVJEEAwvo1myzPk6IAy8KQ67fIAKnOLIp4yp0HPS0
         /9oAyKgR+ExFk33ktTlZOLLejhmfN4YYmPM9qbYDUfw2lcBG8/VBbwcSzEzHR3q6SzrW
         nJ+fX8TpPNMxdvYXxc5/7KDa7OJK2FdgLzTFQyoHMlrbsQwGrpqSJDbQvqldWu8BeWMh
         FlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=996Ku5fUIZ8aX1Zd+uRzgrTqI/japL9jzHZL8VFig0Y=;
        b=g7c2J7I9xsZyFFlibaMfHifU0AgUUuw51d63Dk3xwgCReUHKVpzBsVV0WzXzqkhetq
         bf/Nhv1aYTS4mfvsn7V3HKmIrrC148sStrlgNOhUOvSXqubCTPQ88Z9uO0fq/mdaARXg
         I3HE+FgHIpIUkykOPfhQq9gaUxfDXZgwu8NXUHQSaYvtyQjC/etj8z2Ffd3X30iz/9R8
         IUzC/uBkZNzz1sHN46HW4ineOiiefzxtvbFh584u50glJwGQfosowphLuR7CuGHOLUnk
         GRmvt2z1dELXL2Bh+/2Gj6zaCq4SfzDV5x6NkU2IS1nWJpXXU49kiUNwOrXMNlSZZyAf
         uahA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H85AV2eW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l82si4377963qki.89.2018.11.05.09.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:08:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H85AV2eW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJiMi-0002nq-Dh
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:08:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi4R-0005dC-2P
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi4Q-0007aa-Bx
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:49:46 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34734)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJi4Q-0006ut-56
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:49:46 -0500
Received: by mail-ot1-x341.google.com with SMTP id t5so4981755otk.1
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=996Ku5fUIZ8aX1Zd+uRzgrTqI/japL9jzHZL8VFig0Y=;
	b=H85AV2eWNGNZtwC5kEbxCHQo/ZnGT0qmchPEE6wLFL0CuRIhJMzq5dVTZEsLEfLQhN
	pdDJzI3A18G3kam2lstBl/g9b3ndKpAVsQObtFawmqzB+gPTOZlmqbfrVyb4pW1M0SWP
	QadqtFStLXTc0E3sTAn58O5DbmVQwGGQ2DIX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=996Ku5fUIZ8aX1Zd+uRzgrTqI/japL9jzHZL8VFig0Y=;
	b=h6U+uNeJPwnQHL7i1W9lSp4tpuS5fYe7twa2asJHRS/4aio0k+cj1qdFp+8igpYQ0d
	sU6mqP7EWEFgbvTih5lGF88ez4XwCXVftFUn4CypGDUB/kTYDja7JFTYFMHlIVQ8y5pv
	UHuNYomh3oagIlA833YAVkCLWufl9Guqf+Mkdq1U+FWTaeEbqCc2GpyosRoLyjtdqCMI
	5LhrXDVzKWRjtQkMm7LmYIVs3djvneCTsMBjNWgX54gT23Cg+ZaSNnhN4maRT3zRUWDS
	olvR4B4N+s7y8nDHy06B2sCaKla9nV5ElofnDPr0M6S7zIJuCOSai5SKgvpFEZUzN2kZ
	ogMQ==
X-Gm-Message-State: AGRZ1gJad8herMtfb3hLM6W/wa9T3HrU1frGkVRKY+XszduSeGNmpQL4
	P7hi0W9yD8mCABMjX6elKEmSXUP/R6dOXM+MNF4ikw==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr13199665otu.352.1541436567725; 
	Mon, 05 Nov 2018 08:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:49:07 -0800 (PST)
In-Reply-To: <20181102170730.12432-5-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
	<20181102170730.12432-5-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:49:07 +0000
Message-ID: <CAFEAcA9U7iXyVxyAXAaErswuj+G6dPUqu4j_8AfBFjua0xShNQ@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v4 04/13] arm: Instantiate NRF51 random
 number generator
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s7DsGqcuNGCw

On 2 November 2018 at 17:07, Steffen G=C3=B6rtz <contrib@steffen-goertz.de>=
 wrote:
> Use RNG in SOC.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 18 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
