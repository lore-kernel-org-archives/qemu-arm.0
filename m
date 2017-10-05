Received: by 10.223.197.9 with SMTP id q9csp785297wrf;
        Thu, 5 Oct 2017 10:31:25 -0700 (PDT)
X-Received: by 10.55.27.136 with SMTP id m8mr6169080qkh.356.1507224685742;
        Thu, 05 Oct 2017 10:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507224685; cv=none;
        d=google.com; s=arc-20160816;
        b=M4kRORNzeepIpjVM00OBC3Ddsbo7rvWsVGHbRecyfHsaKaneiJGO1K2Wflg7DPbBrg
         ZULoY+mjcij3UpBaNoYojEpZASDpRhcsM8mDNiOyqRnAk0romi0PRVgNibnnFZCCqIWn
         fv+TWBmZXUQu8/isMOfmJpUj8C6VQeS+ora6eRgBkrhobTkbYsr6Zb6cQWMtKwDC+hnU
         OGmQSHdxYwY4kCtvfCnmWt1DOmaB0GnlwCRuYX6yZuTSTuVZT2iQ4fIetnTiMf9QNyyj
         Rqa5pLj2VDvSJEwandSBJDUmtHFMmjyUzT5Abbq+EUds+M/YBC9RQT4LdxgaRbgYje7O
         Uqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ZbxlmqertxqY5DVMyEYKDXMNdFcY2nHWzhJC5bi32Ns=;
        b=f7r2OxI+qaIZcq92Cwv1omk4fF7QyxQJz87hstJlWTeNgUKHC5DH5P37nhMi5X8d4J
         zzrLHPlyO9Zh7tMqJiUa7pTX3KF334j41z1nf3fARCfpPt9hC1RXmeLQcFWtIU06qAyk
         ECwyNlmDbulfAROFLErBQWhJSWMPu/ZqUo6B/TbXyly9Z/kHHAkk+ZJPoHF2IdVygYAZ
         Zb/C5+XR9bekPqHitMjpDAFBELuqALJaO+Djm4zC6tshBDZuywAp20hrS2cdOQmBPH5J
         /ynb8R3J9BYocs1mm7lOdGLIiWRvps/k9QDNVrtV69reQCbD5dQ7WyucgVnlHjCkHHzb
         tS6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvfrWc6G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si3930181qte.475.2017.10.05.10.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 10:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvfrWc6G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09zZ-0002oQ-5n
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 13:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09yf-0002UZ-9D
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 13:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09ye-0001cj-GQ
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 13:30:29 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:49075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e09ye-0001cA-At
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 13:30:28 -0400
Received: by mail-qt0-x231.google.com with SMTP id d13so26116013qta.5
	for <qemu-devel@nongnu.org>; Thu, 05 Oct 2017 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZbxlmqertxqY5DVMyEYKDXMNdFcY2nHWzhJC5bi32Ns=;
	b=TvfrWc6GTLWWKvH7msxbPO9jP/c3atifZS/6qk/2xZqq6tHsbNoIg5emotl/+Td8Jj
	rSnEgvhfOGDB2V60DxS9q0Fe7QzF+l5j+yJqDZlhfHJKWHBNDWpLIQurtaeczGlpK8fN
	+68w/tIHkyR0s4/6W6bHwHQS1wrOP3kuUt+DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZbxlmqertxqY5DVMyEYKDXMNdFcY2nHWzhJC5bi32Ns=;
	b=fiLjCVz5YVNPsR1yzRrBdeF9sv/x4UQHmCbchkJlVHrHobBNxZVwMdvBbQXzJwmD5x
	0jTRKQ0ed+k+SCgVrq+DD4OpGPGWUllW2TXImROMA1Yj+Zx69zrZkiz2TjlPMAAUIxJZ
	Q5TfotfHeZctPacHw7qUiDS4uiN11Q620HOu29txIyFh/nfsvK4+3n/2q9EPUmwq2Dbk
	yGJw3aQ/dBmBbctZ/DHh5Wf4FjiFbynpwvelk5wUsLwudh4jd4yCggegaMO/hCXPsodH
	CRA4B3vPg1L5HR5GvIad+EzreE+pvTyV7Doffrd2kxkrAOyphencFSs225etkHH1NwL5
	1R2g==
X-Gm-Message-State: AMCzsaWDDMjiXIyYkS0/blG6kVaLPJYZyO5r9ddBo+jzwCY2od7Ga2Pv
	Rxewyxd/lUpQQ7MuV5bpkckR1g==
X-Google-Smtp-Source: AOwi7QClpJXl1OG/bfQFWUB9SHF7ycRtp7qQL5bZFjWGzsNHmPX7fBClgp5UQiKmFJu58+OP/1zcaw==
X-Received: by 10.37.66.17 with SMTP id p17mr7242511yba.242.1507224626632;
	Thu, 05 Oct 2017 10:30:26 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	p193sm4880280ywp.14.2017.10.05.10.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 10:30:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-12-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c626067-0c52-1c2a-eabc-d6c1dbfbe4a9@linaro.org>
Date: Thu, 5 Oct 2017 13:30:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-devel] [PATCH 11/20] target/arm: Add support for
 restoring v8M additional state context
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vN7GWIeJF7jM

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> For v8M, exceptions from Secure to Non-Secure state will save
> callee-saved registers to the exception frame as well as the
> caller-saved registers. Add support for unstacking these
> registers in exception exit when necessary.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

