Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5166970wru;
        Tue, 31 Jul 2018 09:38:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcN0LGIEQYtpo+64OfQ2YvVbTdyErPmtRxAtfZAyJ1zJ0viu2Tj9Vap9ejXxv29rqzh/l+X
X-Received: by 2002:a37:c0c:: with SMTP id 12-v6mr19889260qkm.59.1533055084152;
        Tue, 31 Jul 2018 09:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533055084; cv=none;
        d=google.com; s=arc-20160816;
        b=PtEDCDlX87lHuxI+Mq0dHlxf49KrF/eKhoKwMqqwA1F0Td7ROgJIx1h1BmcXudMfQ+
         3CCyx+R6aJmFkk265FaQvD5m0kxtXjcRvu6Fd2CQGVOigmTapC5j0D794Ng7jS/3iItO
         8uPzXlZ1BvkmGDIsUtlSsqxpyqeS1GMzufOVjSTOKZqNXkzYZumIFfnnuJ+BR6DKrHF0
         0Rmfnoecz+dDcCtsCLIvoYlMksIhG2RPVVrkCIsEj4qZlITiaUMlNq9eNR4xz4raecWr
         76TnTbwWHp/94TaOn+4HZ77J4nl5Y9UA1C+XmOb/D84F/sbcgNemFo1SLCqmrIKe/xNJ
         XZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7YfJrfHLS6Gw0n9UCuvYSAEDHgXbWRLSuD6mrDC+2+4=;
        b=PQSTIc82CKFBzukPV52Q+sg5Gpk3RhQ7tP7YCi2kTb/25KkqjDpgbi4/SRliZWV4KJ
         IWVLzpnvCvGOL6ON/JojWKaO8lqSR05Lk3gD1cUksglh55abfqcuzFFbZhWsTiuznFz6
         b3loDbG+6aML1Nf0jor1XDZaES60tbVssLgmSkBbjbzn0zJhJBmevSodIwkBgqYHoaYU
         JAAKwAEBays7Jg25iwwfSXEk1+kOQC6k8rX8/m8jYmdY8ULgi8UOOgdpU4vqfQqEqk1T
         rtQiACLhoD8HBdP2s7sXg2tay+CcK/RZUxdp8RB6Wf8qpS6cyE0bCI5KwREnWDYaKAQM
         zUpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpcHMi4+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si1624099qta.399.2018.07.31.09.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jul 2018 09:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpcHMi4+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkXet-0006bU-KN
	for alex.bennee@linaro.org; Tue, 31 Jul 2018 12:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkXdX-00069x-3w
	for qemu-devel@nongnu.org; Tue, 31 Jul 2018 12:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkXdS-0005en-Hn
	for qemu-devel@nongnu.org; Tue, 31 Jul 2018 12:36:38 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:42219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkXdS-0005eT-9b
	for qemu-devel@nongnu.org; Tue, 31 Jul 2018 12:36:34 -0400
Received: by mail-vk0-x232.google.com with SMTP id t4-v6so7827141vke.9
	for <qemu-devel@nongnu.org>; Tue, 31 Jul 2018 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7YfJrfHLS6Gw0n9UCuvYSAEDHgXbWRLSuD6mrDC+2+4=;
	b=CpcHMi4+1McmvfZ5sUEPjwiJVxdeWyrUynjAhKjDvem/1t7ZwxN0msyE3tQ09/zg0T
	YcWYzrK387fzPBKGKXP1PnifrCObUB+O2AKhnBhGR+J5f6cQW5fxw+0H4DHknQbGt/jB
	Eb9bwgue+7WVH768EMIXm9a3EHJHdNMVIuXWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7YfJrfHLS6Gw0n9UCuvYSAEDHgXbWRLSuD6mrDC+2+4=;
	b=MGchndg51uDuh6cYXSfwybhXlrUL++6C/OcJfzzF6gilV6DJP90OWuVZoJ6nepA4il
	63ogdzBZry71HMJrrxS37ZnQqXnM7iRhPGw2FoTxWPcqyvkDgKPP13bV1wtA3cIoj+1P
	C2HS17P7OvFoG+XtYXYZj1ZRxSg56Bc1pzotX2HYoXysXUZEKY1gh29HyQWNEMsESvWH
	sAmcMNQbFcl2WzuWHCivHUQaLfNoXeU7UnEcm2NketI8G0nKzgBxtZAJ0XVej8G/8rq1
	DCPSnPJOh8LtxPdi9t1qV4gRg7q3sPTECpL8jJXcnIYYBd7VE3PPNDsWouyct4reN72/
	KIUQ==
X-Gm-Message-State: AOUpUlE7fBQz1sQ+Y5uCTuCgtTs8dF9Ab9Tl55lT6lTIcuDmeV0LcC0A
	hjBHjX+HBEm2hrdLgQVvnQ2GgA==
X-Received: by 2002:a1f:a803:: with SMTP id r3-v6mr13750109vke.8.1533054993419;
	Tue, 31 Jul 2018 09:36:33 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm2941717uao.16.2018.07.31.09.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jul 2018 09:36:32 -0700 (PDT)
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooME+KJVWJQcodVC-Mo2qpZhmYA3LVBLQcTj88qW1i5h5g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b29881c1-ae9f-d6c1-9dbf-eec3051d65a7@linaro.org>
Date: Tue, 31 Jul 2018 12:36:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABoDooME+KJVWJQcodVC-Mo2qpZhmYA3LVBLQcTj88qW1i5h5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] ARM: SVE while issue
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zsmt/4vfoP0m

On 07/31/2018 09:52 AM, Laurent Desnogues wrote:
> Hello Richard,
> 
> according to SVE specification, whilels/whilele instructions have a
> special case where if the second operand is the maximum (un)signed
> integer then the result is an all-true predicate.  The current code in
> trans_WHILE doesn't seem to capture that requirement.  I'm afraid the
> fix won't be as trivial as for the other two bugs I reported :-)

Still not too bad.
Testing a fix for my branch now.

Annoying that risu didn't randomly generate this case,
and I totally mis-read the documentation for this.


r~

