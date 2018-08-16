Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2076856wru;
        Thu, 16 Aug 2018 10:02:16 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwsjXHegrHvsQaIE+5QbFrd06tXUmYk1VCeWKYoijgn9K64hgwB+GEtPPve/gffMtlgD/gQ
X-Received: by 2002:a37:9e11:: with SMTP id h17-v6mr28506497qke.71.1534438935980;
        Thu, 16 Aug 2018 10:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534438935; cv=none;
        d=google.com; s=arc-20160816;
        b=D4TcYhYDdns0caDvmyXHaMc5Pc69HK4UEtWHmC9kugVD+9bQNq55IOZCYl20goSV5B
         zQs5xo28RktTXWG+1UA3BfjFJhW+aUgwhl7W3ecziPEEzEuBrRwRcSrsct5351CBImXP
         lpwmXgE9AtEgPPUjRx26pRjCegsvAK7lZNeHoXlBSkUq5xazJCDy0m48K0hjE3XTehLb
         8KOUfyWlFjTmhw4A0/CDS1r5+CZ0h2T0ILlt1vM2rR/O3OjnNGajC4qeOGVimynUhzJP
         8xYDOqz7L/6HJ316qHY1PGR5TNEIuee8DkLZVUQpsV0y7Ir4e3Ri4h0OXCQBnYb9/XmU
         e7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RELQi3a0jfOPeqjiwGIzgfnkZp8WcXahKXSfJMCUBeM=;
        b=sQ9DoIO6TapnaL9JKAqth8/DzgxTcM8oy1zSdoe72ggBDo6Up+QkPLAxJnMjZn0KNL
         ktTDS0XaLjwvRw01oTMxdQjsbeI7sToR2I3iL96/7RHyHynX6BlartkSfT42FnmcrLue
         kJ4jOCVufefu+lnjwF5DwhK0BXrnJFSrWqAwH4TfWTpV073Vyv2joLb5iz8JDxmM3oJp
         uiWW812boiAMRI1g8imbFgmUenc+RY6mXfE81l4W+iYVwEZcD6shlBRk8lQndGhbIKhT
         PlMptyjiOgpbYQn8zCLUeyEseAw8ICSN2D2Gahc2quo1cA8QeLMnWvf/XWTJVSOsXtRK
         fapg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FHDC+X/6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si2552591qtj.247.2018.08.16.10.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 10:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FHDC+X/6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLf5-0002rl-Ge
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 13:02:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLZD-0001O9-MH
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLZC-0007SL-OM
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:56:11 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqLZC-0007RX-Cy
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:56:10 -0400
Received: by mail-oi0-x244.google.com with SMTP id b16-v6so9221684oic.9
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RELQi3a0jfOPeqjiwGIzgfnkZp8WcXahKXSfJMCUBeM=;
	b=FHDC+X/6ur01g2ddgJQqs8oUsOENWI0wX6BemRYhBmBwDvccP0qtxg6EMyjebgv1Dz
	7OLQY9Fm0w7BdMCpG4ka047TjMQyliVN54tsBujVfGb5vnjT053sliq7znGilYBGzBD0
	H7bddQ6GFRefF7r3ieFCuDhLUZq3SMlLTMpB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RELQi3a0jfOPeqjiwGIzgfnkZp8WcXahKXSfJMCUBeM=;
	b=JkZ1e+JcWPNkOwiGgKDrwBCEa6lyfIs25YDbO6C1oh4QsMkV5hV42AYe2fhrSbutn1
	NdAMiG7lRRRCJiwyViLzw8F6kkYzfWG7vZTuJrq5hB34RfVS3i8D6TdM7qfsJ3VMSY9i
	T45OP7yWjlejy3CwraScn7+TNLOKOyV6iJOD5V7Eq9Y892hz5CFGeiGMLQJl4LsYwGjW
	PnZRiJjUJy3yS7fJ2qOb+vo7pXV8B7c5EwpjRXVVelvm8lWXzlPViT+f+EKGzQtbOTuN
	ZMyccrd8TA7mAfOtVUWwDBgqH6KmY8BEahFolrpKbpVMSGpgF1C3ilhZG3whEG1DlXhv
	Fa4g==
X-Gm-Message-State: AOUpUlEywUvnZS1TwUYfx+VQ+1yaFDXSqoKYuhHjbjIsM5S+IjHPdiAK
	G1xfNyJYomKH2YjAsHD0tfeO/sM8auO9hLWqj+JvDg==
X-Received: by 2002:aca:2c89:: with SMTP id
	s131-v6mr30829143ois.171.1534438569650; 
	Thu, 16 Aug 2018 09:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 09:55:49
	-0700 (PDT)
In-Reply-To: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
References: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 17:55:49 +0100
Message-ID: <CAFEAcA9DdtZ6+vrX9e30DX-9-68oFo5+FBeVq-B7QQsiQRM7BA@mail.gmail.com>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] imx_serial: Generate interrupt on receive
 data ready if enabled
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:i.MX31" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: msf1pKXhcJtY

On 15 August 2018 at 14:55, Hans-Erik Floryd
<hans-erik.floryd@rt-labs.com> wrote:
> Generate an interrupt if USR2_RDR and UCR4_DREN are both set.
>
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> ---
>  hw/char/imx_serial.c         | 3 ++-
>  include/hw/char/imx_serial.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
