Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4041766wrt;
        Mon, 10 Dec 2018 12:42:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XMLzm10kWEND3zdlusMsvhXZ4fBUe9djNzsyfWB9T88JX30hOm9qW4kLKvMNBdWvU5QhKZ
X-Received: by 2002:a37:b084:: with SMTP id z126mr11929419qke.154.1544474524326;
        Mon, 10 Dec 2018 12:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544474524; cv=none;
        d=google.com; s=arc-20160816;
        b=T4kxu4Iu8BEl1MSZj/SPH1DN/inISAoCbZvEECSe9OSw1QoUefPVzRhJAHX2BmlvKK
         5E0kSiwaKcNxrEWQzGIxlLnLLV5z4bqoHwy5DzjGa4MSMbh4UtOajDvdmM4rPNK9Xb5F
         h2G3/0WhpuJfGEB7JcBD0PGZAR0QiQS3u+ZlQUJBV4RoulVLtzJ2NL64Pzh8h3GPdt8P
         ch0VM309IPj29kWukzVYXOgoLDFUdTXBHz3C6O/r0oV8FoXtK1OsTsZurxwzd3p0ZFxl
         2DOBMVohapPvrqjD/oDUgaiOtuc3kJC/vlyFlFfYPRuF1Q95qKEyywCJSD9fGZH7/g36
         dWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeXDjEtNYwcO6MkEEYQUYaiC4hT5Henhwn0M15F7zYo=;
        b=RZKbbFFMxp+BBioLLudd8A9p1UZTy3ZdTfsgwR4HUAK91zxnatmw9XwETEo77agJaX
         hGAF3KxnHl4YMa2R3wbDlZlZJWZPO2zYkqy63yGp58MX01SW8UDI7tLjZUkd/2hUmW/E
         1sUowaQBMG48FZwuD8O1tM37D591cUnL8QLexFKA5qdPEyW0hqea/bW2oU/tFz8ver0W
         G4/Kys13uP1S/zLFHXX3KiIheneBI82rKVkNUTxmM5N9F/Y6I1p9z9K7A2F+5M+Zu9TQ
         utn4j566TJtzbdPJ0C7aDUbfhorRk/hrJhFsHtyqWoThEM0HB0jUi3XzBfI1DtIKQUL6
         aiqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SnGc85et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n33si1634505qta.256.2018.12.10.12.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 12:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SnGc85et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWSNP-0005Lw-KC
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 15:42:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWSNC-0005Ig-5K
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 15:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWSNB-0005xz-Gg
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 15:41:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gWSNB-0005vb-8k
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 15:41:49 -0500
Received: by mail-ot1-x342.google.com with SMTP id a11so11785719otr.10
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 12:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OeXDjEtNYwcO6MkEEYQUYaiC4hT5Henhwn0M15F7zYo=;
	b=SnGc85etrssrRmRNt9WIx5vLEqugT7LTaOnymAV3KXDo1+h+9mR6ZMoa/TACdhe1q+
	i8M5u8swJAPW1FMsj0AGGGlp1U+xqEvPMzwFqZT+BSPxstAHgsrK0O1wHEwzBMBbwsZx
	RwGXlQypmKC1RGoVpTrc3qEi8ovWErhEnRZkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OeXDjEtNYwcO6MkEEYQUYaiC4hT5Henhwn0M15F7zYo=;
	b=YC6SKVJ2827DCXfwDcqn0aZXHkxIYtzclXaJpajAI1CTSlVhXBgVp5/GocxDo8J9jT
	Lorf6VWNGhanOQ+j1nBZHASNo0c6JHsbStbhUkBgMaDfyYRUJ+Nmq2CBKKY0dnSCHc+D
	EJVPznki94+9aYaEhXoNWLW2dVNhFxDh9kODTsAlNBiSxyr9qzoImdtvkXUV/+CSEU/7
	UqH30HlJcKHf9xFT9SHNkVEpQXavqNiQTAmQjVYSWFTDbihxyVbFvJifQNE0bCtSAaeU
	HoMdS4rD/FdiNKKQe/bCaFzXs/ndyQIdtXhvW7zIrzfNQQzaFa5H60LdeNj3eTlDmdWj
	qtSg==
X-Gm-Message-State: AA+aEWZ2Ufiqjc/G4OA3y6lGk1MKrNI+KXrGuQxIzgZBWzBwpj+hdk3d
	RCNMilQ5ccv+7pwDsgS2YWRTHz/TZttvJRxrZXKEeA==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr9797216otb.238.1544474503994; 
	Mon, 10 Dec 2018 12:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20181210183836.20074-1-qwandor@google.com>
In-Reply-To: <20181210183836.20074-1-qwandor@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Dec 2018 20:41:32 +0000
Message-ID: <CAFEAcA9kXXeRkFamN73XREDp4QaokMs3E9TRLThKf4zYufapSQ@mail.gmail.com>
To: qwandor@google.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] target/arm: Implement VI/VF bits
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
Cc: qemu-arm <qemu-arm@nongnu.org>, wedsonaf@google.com,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BrUY2UxyPsFZ

On Mon, 10 Dec 2018 at 18:38, Andrew Walbran <qwandor@google.com> wrote:
>
> From: Wedson Almeida Filho <wedsonaf@google.com>
>
> This lets hypervisors running at EL2 inject virtual interrupts into guest VMs.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Andrew Walbran <qwandor@google.com>

Hi; thanks for this patch. I'm a bit confused -- can you
explain what the patch provides that isn't already
implemented by commit 89430fc6f80a5aef1d4cb ?

thanks
-- PMM
