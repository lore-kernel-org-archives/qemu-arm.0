Received: by 10.28.91.67 with SMTP id p64csp883361wmb;
        Tue, 13 Mar 2018 09:07:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsYJye3Cz6SGt8C/kxZW5fGsx8diQjugVE6K2ip/KE6VyXf3+8jwpUEpJMOkkol8XJmYAd5
X-Received: by 10.129.182.97 with SMTP id h33mr973954ywk.90.1520957278759;
        Tue, 13 Mar 2018 09:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520957278; cv=none;
        d=google.com; s=arc-20160816;
        b=EADM2ja+UljqDKCcOd0oMS983ePaBKaflkEogKQaRKMy+Mz7XPeL9+x/DoxPvHjtEK
         1HYmZuVuIWIuYifDYupdmwmEgtr5wdQkaaW2Qp8qVS6HrGojSWU24Uc9pxDSWRMrefGb
         dML9V3MflmRea/9CQ7TgY0BbV4+hTnwC+9PKjuwNcYdPqrDFko/Zoqskyj+y1AkSpuMb
         ZZjcTrYdKnjleys+59vvWcMF3PihdFTiJGRBBV05zK/Hl2DUqkCweRhyaN3rhdklqkyU
         zLiVr29xCjGEbApXJFzeFfNBh+BQqNTRXBAzaeDf9/EYgSHpCxuG1+UsLroad7dAv/hT
         /boQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GbDyj42Q1Xvp146xGWoN0SENBVo4OlEKntS5LOGHkiA=;
        b=KxO8UhStmNhamuCn2sYduk2A3owcVsFxdeu4Oe30/RYKDr9aSr0I8X4QvzITUrgvIz
         kKU8+H1JN1OnFkX3Us1L0i7eYvz9E6Y3FcBmKNMsnaqNZAjZ70RQDB8J/2FLSPksSmp1
         cZFbz9CBsDc/OqvtpnyQCSNjN4fAaSnNCnQQduqngEqTAOvNrhLjoQ9DZhVpnqTVMxOK
         wT3FjqP4dKPD7Otn9K6Lwf86K2eblUA5IkcEObzAkH+RJbfERy1eAW9zOmhfauMOFWSd
         PHnWBMuPXLndGEYoegUedo0b61JrEcQzPtmPhw5LJbEC6eoFIry1kxEHtUFAsmsASkLt
         03Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X3NvhI3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d26si529901qtk.120.2018.03.13.09.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 09:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X3NvhI3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evmT0-0000Zr-5t
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 12:07:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evmLn-0003G4-Q5
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evmLk-0003CG-0D
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:00:31 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:39705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evmLj-0003Br-Dl
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:00:27 -0400
Received: by mail-ot0-x234.google.com with SMTP id h8-v6so108053oti.6
	for <qemu-arm@nongnu.org>; Tue, 13 Mar 2018 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GbDyj42Q1Xvp146xGWoN0SENBVo4OlEKntS5LOGHkiA=;
	b=X3NvhI3Uh5CYskY0L6Vw2yEComsH8juKCREFljSAi8luMYlr3Jhsa6Io5oAPu3G2PZ
	QWY/jH8k+63jqXHkqZFAzHQLWLScMRpMLkEzGIGxzvehuV7aO9CXqwMFmvbFqNP9c1aV
	dtnJnAtEES/kFxpajHVrrvq0OOyHYgOULgY4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GbDyj42Q1Xvp146xGWoN0SENBVo4OlEKntS5LOGHkiA=;
	b=FZ3txJMQikdaXIzyueCUQawphlUZGC0nP4kIKQXIhJfF+2UwhSHBfrW8+rJRZKqT+i
	OOn0/XHpkDIBLQGIvpipMAnCmhlOq4gBVb72Q12MxXv500JowFCFhcA+iclvzWL0zG1d
	PDNW29wrw2Yl9pM3YLxtW31HNL/ngfaIyUCGUOItFqhgTZPcoxwE/aztQFANFOvFx7nM
	Jgjk4Q5lnj4YsR7MXVeDIIIdrzrA21jf+RX7P2fHpXxXWuhcqVtggG0Dw+nmugXeYxNE
	A0kFZXaeOLVey7ZfFL+U70LlSBce8nysWaqCyAgFGHDQkvsMzBJgFvVl5yuy54a8U1Zj
	h8rw==
X-Gm-Message-State: AElRT7EtUTij+/RJlfDVP3135+diCzSICu6UhmWe+7PLSJD2pZPSlqpl
	JEk3M9SlD6O8UPKIuCEa9PR8P0Ybpe6EIpPEbfmvDEa6
X-Received: by 10.157.72.231 with SMTP id a36mr845929otj.308.1520956826514;
	Tue, 13 Mar 2018 09:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Tue, 13 Mar 2018 09:00:05
	-0700 (PDT)
In-Reply-To: <1520850690-23245-3-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1520850690-23245-3-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Mar 2018 16:00:05 +0000
Message-ID: <CAFEAcA9Jcb11QgYkPh6VnR3CT2ADaCRdwn3TLtBOgCr+WRsYhQ@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [PATCH v4 2/4] target/arm: Add "_S" suffix to the
 secure version of a sysreg
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0uEiun8aESz

On 12 March 2018 at 10:31, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> This is a preparation for the coming feature of creating dynamically an XML
> description for the ARM sysregs.
> Add "_S" suffix to the secure version of sysregs that have both S and NS views
> Replace (S) by _S and remove (NS) for the register that are manually defined,
> so all the registers follow the same convention.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
