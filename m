Received: by 10.223.172.38 with SMTP id v35csp1147629wrc;
        Wed, 20 Sep 2017 14:04:04 -0700 (PDT)
X-Received: by 10.55.17.207 with SMTP id 76mr50369qkr.178.1505941444788;
        Wed, 20 Sep 2017 14:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941444; cv=none;
        d=google.com; s=arc-20160816;
        b=yOWX+ZkXtVOXRAGBzPTHokGJnuLBeb7doSE+7DA/PPEHuqfZWUPuuzsrxk4E3oNW2u
         iHetGRbxnwZuo8lkiWwDq/Y/A5KEnoz+lk020u3roTYpqiE9RYhSP0IgzFAV6kUUeeFO
         zVA3CsShZ79wrrNpGRAyzqpznIUsC4USXnvSCOsmT0Cv8Z2Xy4cvwninFu2jm1msZex3
         ErcDrZpKviqGgVN4mieokujorK0LgBAyjjifl98DUx7tr0dJZYYigjHTxaMmOjfKk5L/
         P0WrOYQVbOBEB+f7CTLsv6tHFZ9C0TY3BFJtgGoVWpTI7VjJ8bf4gsQzRJXgBXhc5ykI
         rUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=gHWQ4wTxtH8ArA7Ho6kZ5ivTVP7qssP/oof3cuwtfJw=;
        b=PIrALL8RFmxZkQ57+DXfTWqrDWjrTWabB5yrJhdjLKy0bQekwxd6HS2ODM8znZcxS9
         WCnq3uFt26BYifx8Zp+H2Ulychk0YkzocKshcfvNSFwW1yca8rTG6dWqcufUEVcFOa0j
         nOsYNaKmvHCkMnPgXu7Kr3Tc+TcyvmRVezn6nCq154fjSvDk7XK1f9dZ643AeH1xWcbW
         QJvKcfLm6JSyfGTKO34h2cp3vs+qYVxdnZ1i1THYcOHJdjkJhwqrOoAFgL+rO2bnVx1G
         zPBlXHUkfYchxCuHblYDgucUvzrwDuu+kBr7P6NyzBB5g8sldZ6JmZYhmNRrCo59KbEW
         jlEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bz/TQU6M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62si2529839qkh.303.2017.09.20.14.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 14:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bz/TQU6M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dumA6-0001cB-IY
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 17:04:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum9u-0001bL-KI
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:03:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum9r-0002Co-Fb
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:03:50 -0400
Received: from mail-io0-x22b.google.com ([2607:f8b0:4001:c06::22b]:52672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dum9r-0002CH-Ap
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:03:47 -0400
Received: by mail-io0-x22b.google.com with SMTP id i197so6560078ioe.9
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gHWQ4wTxtH8ArA7Ho6kZ5ivTVP7qssP/oof3cuwtfJw=;
	b=Bz/TQU6MUn4XT0RchPYY3PQQjQHYwjpCtq5OzzNXwCrQ49CVx9ZM/HQ4j96PSlvWhA
	d68JdPCLrdS4c/0yQE/FoBK4sQHt58nFcvCTKRIU9T/6inrd0WRvxkiJh8WrT23kb6Ja
	WDmc1Ask0cspH4v1U1vt0Rd9wnL3ssC2c2doU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gHWQ4wTxtH8ArA7Ho6kZ5ivTVP7qssP/oof3cuwtfJw=;
	b=CGYq+dqFYF9+0UcChfWjDJH+e1Zp6Y1GBJ5GcZLJsvaC3st/Voi7xjVT2BX2wsuudc
	a/kAEEkNpCFdXFwqgPaoMV68U0WC1dEcPdCb7d0hAGt+qY6cAoEt2e9j8r2fwW4jezyr
	I1L3uMW3wH4p45unMSOD8LBOzUDEiz32wEGIaB03onUsK1kEZvUNnxaTJEOxxWUItKYi
	ktj4AI0cVhsVNCRMarDTcDoJTxhZSo0raPvVtJ5mqVs/3w5vX12Np7+cUG77gTlgN5zI
	/LFpSuH7YLpB2HFPqEPyonAlQSZea/i3XUWYZ/ZzLVNmsgjiLL8xsUY/laQVswq6lMF6
	5C2g==
X-Gm-Message-State: AHPjjUi+STYuiEYcc5kfKYAMveExNEkWnTdbau6aNGEhwB+ZY1VQvMJ0
	NXwWmUo3zc5vyIN5qQLNAeH61g==
X-Google-Smtp-Source: AOwi7QBecyv+gY6wYcDTLk4VpCE8vJKMKe67z4X3mBnymChppSimu4VdHn8JqHrutEJNQTkORdzxMw==
X-Received: by 10.202.75.17 with SMTP id y17mr21434oia.55.1505941426675;
	Wed, 20 Sep 2017 14:03:46 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	k124sm2496769oib.0.2017.09.20.14.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 14:03:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0904d1e-9db9-ec39-02fe-eafdea3e013a@linaro.org>
Date: Wed, 20 Sep 2017 16:03:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] hw/i2c/omap_i2c.c: Don't
 use old_mmio
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tH1MzrfEGW4j

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Don't use old_mmio in the memory region ops struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/i2c/omap_i2c.c | 44 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
