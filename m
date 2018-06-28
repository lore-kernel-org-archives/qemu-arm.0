Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7269323wrq;
        Thu, 28 Jun 2018 03:52:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe1bydD9ely45674nKyI7S88/uje7oK+VQnnf/lWCw6NuWJzfnJxNKPfK2BcKFQq4VJoMsw
X-Received: by 2002:a37:6812:: with SMTP id d18-v6mr7281574qkc.215.1530183176391;
        Thu, 28 Jun 2018 03:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530183176; cv=none;
        d=google.com; s=arc-20160816;
        b=BnUqHybZ6DJ9CXnHQbb1Xwp8GD18338bfyZLGQcY3hecFr8LejxNL2n4d1OxkITI1b
         OdUzRTxyzPs33V+UpOxtEMjf0RCIXoU27HEU0g6xwRLgi2gvlRjbs30WpqVsmivaKzZA
         seJVTH7G/wfgwWQSXKz1AYEU/XiL6iofAlqETlKpgipnEXTYwmm2qwu+Aro16O21RXca
         Synb6g0pGS4EUpwPZGmBk0XqKwAW4vk8VMOEwEJlf0S3TFhC6VpTMYfNyjkL18x/IM93
         GrT+zQust4wk9BSHCXjEeTlq/PgI4hgia+H2qOvJe9AfQIa68v84215P7u7RGJe7uGMk
         lpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5OlKxzz3GmyPo2Ou3WBcrERRmOcYcIpiHtOmqdhxwTY=;
        b=rocfyYiXWgIltKsafKHPM8rEpbMUWFuFzbFpCqKh9QYr22IUGvTyz1GjGTEUgECefI
         ekzXRccEek087/plO9kMzeCO+MDOBT3gSNblv+vpnXqN4ycoKFXkTQNi1X0sUagBO40B
         LghgAFHfV5AsJu5MYHqkqlsOxkvlrIbVQySPfdl718Pj/ISUk8ohTzQILLwSL9fPqp+M
         tj4Iu/YCd6C3PWb76jvCWmuKmu2NTmo1fuqguKVCvWyrQX8ePOraQcgw1hQXLH/lrZ9f
         jJDvMXu57wnmnScWlwZj6QvzhVBaMi4C/bYyrbz0WEQs6YRB9F5OCkRZCla58lHVJSIo
         u2Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUHtRU72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j15-v6si4297571qvf.10.2018.06.28.03.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUHtRU72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYUXn-0006lJ-Sy
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 06:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUXe-0006ko-WC
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUXe-0005AL-AJ
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:52:47 -0400
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:37474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYUXe-00058H-5a
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:52:46 -0400
Received: by mail-ot0-x230.google.com with SMTP id q11-v6so3411256otk.4
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5OlKxzz3GmyPo2Ou3WBcrERRmOcYcIpiHtOmqdhxwTY=;
	b=bUHtRU727UoNYBlvyqF1avCeVoZ6jAGSzg3/jgEvDPXuKG2k1YxW9kepaxFEkpPa6x
	r+vmS9VqPNgDPGX6AOGixmLBwGHQ8xKHntz22DvhkVi4zqAQPzPvHDzhaf25hNqhx929
	tnRftyl1ZevMSUt1dWsrjSeGIYq2jZpWWgPtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5OlKxzz3GmyPo2Ou3WBcrERRmOcYcIpiHtOmqdhxwTY=;
	b=Y7EAJjl/gzLkg840KYayAH41RVvUIgYgBWwPkBvXG7uG1B+CrQuopAOQ1X6BlPTguU
	6iLUsMsfORnxORYiiAC0JbOQzHzYH1eEtomZunVBo0RZMg2I/2C/Wa/9YL14CD2UjHhB
	Lb2xgMOdSOuZkiIHyXeR5bAlAQqYqO0vt60uqTjM1rrW2MZerl5uwssGI8r/cRLC3weG
	7cpfYHwOAuby6Hkb/utRLrKn09W1JeLeiB3zrM+neUFsSa+dCrAXUL2Knk5ez5y1nCxV
	VfEKpWiKWqi0qmCmd97+II6baVILXYfHv8QdoxQjS/g7P4gavA1Ac5Fo9ZCMT77013Qf
	dYpQ==
X-Gm-Message-State: APt69E2EX0HBAo0h6L2J3O5AouEJD1dB5MlDZkcMjB8Z8ripNr3QEGDF
	8MoOhZmIOXmOESWETxBlA1uwYkEgroRrdUwNU5ZLlA==
X-Received: by 2002:a9d:44d0:: with SMTP id
	p16-v6mr3804087otg.126.1530183165142; 
	Thu, 28 Jun 2018 03:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 03:52:24 -0700 (PDT)
In-Reply-To: <20180627043328.11531-31-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 11:52:24 +0100
Message-ID: <CAFEAcA9c7=yUujTKS3nE99kxB-j4GagdG1eq4EGVZ=bUCs8Yow@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [PATCH v6 30/35] target/arm: Pass index to AdvSIMD
 FCMLA (indexed)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lOAGUnyIwcgB

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> For aa64 advsimd, we had been passing the pre-indexed vector.
> However, sve applies the index to each 128-bit segment, so we
> need to pass in the index separately.
>
> For aa32 advsimd, the fp32 operation always has index 0, but
> we failed to interpret the fp16 index correctly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
