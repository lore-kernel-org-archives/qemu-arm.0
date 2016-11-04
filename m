Received: by 10.80.166.35 with SMTP id d32csp1205541edc;
        Fri, 4 Nov 2016 07:58:50 -0700 (PDT)
X-Received: by 10.202.107.76 with SMTP id g73mr14223165oic.1.1478271530717;
        Fri, 04 Nov 2016 07:58:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w137si8961397oia.170.2016.11.04.07.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Nov 2016 07:58:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2fxB-000538-Dr
	for alex.bennee@linaro.org; Fri, 04 Nov 2016 10:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c2fx7-00052x-42
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 10:58:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c2fx6-00050c-FX
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 10:58:45 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c2fx6-0004zb-96
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 10:58:44 -0400
Received: by mail-ua0-x230.google.com with SMTP id 51so68133594uai.1
	for <qemu-arm@nongnu.org>; Fri, 04 Nov 2016 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7eFIwQI8u3O4b0rwxVLZX9UEl/3lOJSUwScJ0tcKiyY=;
	b=MxftlLhQnhbxetTcOqJleDxCU5usNkFK8thMYUMJBXPp4sERzC51LwG+1XRLkflVIl
	WdCgsfU3j18JyKKVxRPn+E6/jhvU3VybTT2/ScP1fNkqUjwQclFRIwz77WXV1jR5jGOg
	9mCsF5buUSgXPG6MVy5+j0g/35aym7RXP9AsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7eFIwQI8u3O4b0rwxVLZX9UEl/3lOJSUwScJ0tcKiyY=;
	b=c+fqxxDW05XSf/POYfz+63+oIxUjclQCRcrR2E9+aoKY9p1srR6hn8C1JFjjNMjAQ3
	84pctkd2j0WuFrdjoPFvO8QOVRA7SMZ0AtaWCCMURFZL+zrWd9Kk95PU5o/0MnQlBvRH
	GRWfW0h8hhcchofOQTHTIhebrg43RHfWWEdqmAjJ2BU1V5eWwIdqKB8cFCkRnENIJ2g3
	4yr4l99f9uJOr6ldFluPof689jRQ1rXfeoBXa8g4OrKDqC4TFzDouhsz2iT1JZgAUSuA
	Y4YtzvDhycqVxc6LcbictMC+YWRcR6q4DQWVGIvROoHt3vwx9IwTl1KK94rySms2w3Mu
	tbDw==
X-Gm-Message-State: ABUngvcC6up+5tCCnqMSySGnZJ/EejKa28H8Qupo57CiJf63Ogu/e4qn/I6aa4uorAomvTl2Y/XUn9EPupWbU5hk
X-Received: by 10.176.2.110 with SMTP id 101mr11723810uas.8.1478271517759;
	Fri, 04 Nov 2016 07:58:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 4 Nov 2016 07:58:15 -0700 (PDT)
In-Reply-To: <CALicx6sH_owFkb19odpL77-Nr16aqVKvmTKYaW-HyYR8+vERAg@mail.gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
	<CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
	<CAFEAcA_AFW-N5siUp1+kM3Z2+ixwKbD35YK+97tCX-g3ENXpPA@mail.gmail.com>
	<CALicx6sgPM_qBnnYGCsRk8XUarKZSiOJEJGTgjYOppzquAj70A@mail.gmail.com>
	<CALicx6sH_owFkb19odpL77-Nr16aqVKvmTKYaW-HyYR8+vERAg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2016 14:58:15 +0000
Message-ID: <CAFEAcA_wbFsPBdgbwbnbPAy4pW0v070E8PMDd5iHvKHsb1RBvg@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [PATCH v4 2/3] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d30pok487TE3

On 4 November 2016 at 14:54, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> What do you suggest for this?.

Some general principles:
 * be consistent
 * don't check things you don't need to
 * prefer functions that exist in all configs (which may be
   dummy functions in some cases) rather than guarding
   callsites and #include lines with #ifdefs

thanks
-- PMM
