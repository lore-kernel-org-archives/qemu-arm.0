Received: by 10.28.4.212 with SMTP id 203csp2011149wme;
        Thu, 3 May 2018 08:06:17 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq7AIvZh0244jhm2YWkVIZURsd0u3r7DJcuF1PuVdbvSaxlNzCsKYK/O/CbC24/paZfXnlA
X-Received: by 10.55.180.1 with SMTP id d1mr3855085qkf.283.1525359977290;
        Thu, 03 May 2018 08:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525359977; cv=none;
        d=google.com; s=arc-20160816;
        b=PqkKktE7Nu6YcZzq/dAaJiOavC8M7M1hMvv/Soy9zgkSXL9y2hNiyxJaBP9ENwhrIt
         MHPenwB6VbC7QHqJONY3loohsB87p8Z5PmAWhJffZWwIHLwgUyLeHGkriWQtTRDqWdNn
         r6/NmxZEvFqy+XeCE2WgmDi6F10I89njPZuC9ByxJxXOdixOMc/utljtJS4Bv5bKAAWx
         JG8WFnK1FTDY+eazm7PngZQPx3NAPDqbminblR7PUlcRxCoSr0IVqfkH1f5xBIB/pDE7
         XQHpyKfX9Uoh+52Xo87zWoIC1bH+qWb65HfFtUqIyKUzSwqaBAXEUJtZDsM6N/TQFhZB
         L6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=g7gmeGyCjr37S0Rx47e15ss25PhOwa6vd4xG4mm7fW4=;
        b=I9n3DnZG/iEbjZogYmWdeeS0jX0M/a5EDFQFTP4aZEMuMVP7RzZQrNsk0vjUnrYRT0
         SrKNE53MdSh2bLjlvOFzeEYwrTTcEsvMZDXvtB6mZUYvPVltdKsbqZX8WLksk5jHaQnd
         vBGtt0+g4XMV6AW4kg1RAZe/yHQ1jZ0TEZ85w3bGIoJTv24MyJINlpq9yI26aN7enYXS
         oCt83BPuhHXecfMxOzqx9hAOM6gR78jxDwbmSsixQDNnLM28kB/HwODwReFYZle4JHK5
         nw9CQIPag7j/upL7NxIpw6DK5kPAHrhDMa1+G5zjgGMcpJLQsrM1TKrOVPh+9sZQqvIy
         Btaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LocwFW83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u55-v6si12102292qtk.182.2018.05.03.08.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 08:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LocwFW83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFoG-00088H-Nr
	for alex.bennee@linaro.org; Thu, 03 May 2018 11:06:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFnU-0007iJ-OK
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFnU-0005h3-1U
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:05:28 -0400
Received: from mail-ot0-x22d.google.com ([2607:f8b0:4003:c0f::22d]:37733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEFnT-0005gh-Rn
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:05:27 -0400
Received: by mail-ot0-x22d.google.com with SMTP id 77-v6so20980555otd.4
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g7gmeGyCjr37S0Rx47e15ss25PhOwa6vd4xG4mm7fW4=;
	b=LocwFW83byoeaRBmiaI+fUDufbhqU/Yhtjnwhz/fHlHZGVqWzf7wawfnEKPz0rHfqW
	1+WjhSa2BvdHT1fPFarqoiHXYMnITSNfMY6rg6ANZMOq0+NhnogdHcnwVl1ZvyrNAbWa
	8j2u3cWV94rfwjnL2qAleK5MZJfiPbp3DVdTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g7gmeGyCjr37S0Rx47e15ss25PhOwa6vd4xG4mm7fW4=;
	b=TD8JCn5/HmkjH6EqyPfhircCEXezquOpsSsJZwmQflyUldH//lEA4Kyt2rfyZaii86
	A+szyoO3RwqBASv4f+QB+ayMJfiELFHl+qO8bAhv0+4VOmlP6bRjUrTz3KQfYfSFQE7M
	iDyphatL+/fqu8+/m8SL3eSXxEnENf/iKe11hS+tsqd3+1dXf+OtBupJ/uDxl+FA+XuE
	RKGw8XW3ySSsba1NuhYPmiXgzL73XO7W1v40aqgYIsKOxxlf1MPNxy+CNJjZUIe7383P
	Pp1U/OA0HTa0GBLf6nmAxdWNnG4Aq1dsLdJnv5ExRynmxBpVmsgmy+KR65nEAnSS5oGF
	W1sg==
X-Gm-Message-State: ALQs6tA/Cg7XvOAnKLnf7jvToqXcDZZkpLSq+/fHwkZJFhUNKBnUxYH1
	hyqVgF3rOJLMAP6oBfJEmoTCPdoMWkcw5wD6ijiHq8S9
X-Received: by 2002:a9d:3bf5:: with SMTP id
	k108-v6mr17257975otc.308.1525359927265; 
	Thu, 03 May 2018 08:05:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 08:05:06 -0700 (PDT)
In-Reply-To: <20180501180455.11214-1-richard.henderson@linaro.org>
References: <20180501180455.11214-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 16:05:06 +0100
Message-ID: <CAFEAcA-fEuV6COE7jzSZLpzRXPEb1pJo2zJjO_nbxXavLjwCjw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22d
Subject: Re: [Qemu-arm] [PATCH 0/2] target/arm: Coverity fixups
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
X-TUID: fw0hrr4VMAiN

On 1 May 2018 at 19:04, Richard Henderson <richard.henderson@linaro.org> wrote:
> The first patch covers four related false positives.  However,
> we check the same condition twice and we certainly don't need
> to that.  Plus the assert might just help documentation-wise.
>
> The second patch covers dead code.  I believe that Coverity is
> right and that there are no paths that have !is_q at this point.
> Add the assert to check that is true.
>
> The RISU tests that I ran over these insns came out clean.
>

Applied to target-arm.next, thanks.

-- PMM
