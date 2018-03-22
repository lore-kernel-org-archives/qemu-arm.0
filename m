Received: by 10.28.71.155 with SMTP id m27csp470136wmi;
        Thu, 22 Mar 2018 08:14:35 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuqtbwvzPkZ2KUmi4I4RwTaZFBB63FX1q/nzCmn6BpFGLZOEfeg8+3Cz0nUIEQWlnHuFQ9V
X-Received: by 10.200.38.217 with SMTP id 25mr34910232qtp.163.1521731675607;
        Thu, 22 Mar 2018 08:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521731675; cv=none;
        d=google.com; s=arc-20160816;
        b=tvA2YIEyzn9y/b3hlI3nzw/Y5QshXi2Zf28njwQMdlBcdC0A7/ftnKtTgKrdm9QZcN
         FX6Lae2/fwFD0z+sEeVq5KAC7kiVmHJsuEx7PhZUzlnsazIdeAGEvKS8LSnFDxE4uRM+
         l6nHbyxvLgc0buKZONbvigTIwe/sQgZtMZCqVy+N9s17UChmLK5PaM+8LkPT+XZuLKhS
         5OXaQQJLHi4hwKQXyIgoPmabtvYYId7mzifFkjfjdTmRnEkDngXPEkdnONpfwSJ23ikf
         sx/KKbsjcvJzCYe1Ts8CB90oOHTc6EIeb4qjhBwtpftFgFbp34dWSzjp2gHjkBwzSyVb
         yI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s8kdzt6dBvc2nvJSE5NXe16skKnc3j9Vu5Y6uT8W0i4=;
        b=l+cmpkp/wrkO7pAp4n8B14koFxgG7MHKIfOzb02vMbK+NULPdpJxvYXMPovpNqIc5E
         UXRT0Fu9uuOG2SooAEPZQGHJ5g/A5NX7FVpVGWKZPNeVxEo5uhPgsgRGI+RXv+q1hi46
         HZfKSzQCrz+hHF2Ffq4nlDI9ezjbXjn6WO7rKj5JpfHPBj7jk/uk7QIR6Uja1kTThuYV
         TAHO7TUhDXRPx/lxio94pALHF+lTC6nLY+7qMJd1Y8q9ifEjE8lJHyPBraJ12ghuh0nQ
         mMoCFtvAbtSJBl8I0PXEBilK4JU+j+9DaNsuBby862UEKmKTISlV4GYrnC9R58oULtFa
         4/lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRXnc3UC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q87si8186911qkl.273.2018.03.22.08.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 08:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRXnc3UC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez1vG-0001vV-TG
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 11:14:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez1v2-0001to-Vl
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez1uy-0001wc-RH
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:14:20 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:39612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez1uy-0001vt-L3
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:14:16 -0400
Received: by mail-ot0-x235.google.com with SMTP id h8-v6so9820262oti.6
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s8kdzt6dBvc2nvJSE5NXe16skKnc3j9Vu5Y6uT8W0i4=;
	b=jRXnc3UCv0wc7zVhGbSyPROqALo0jYBPxGH43OdrAnz6KlsFWVXA3XnwWpKkVtUVqm
	oYwW+UjKrGPuMa8rtZBUQ3UiNKh+TeQcLYvzJdcYh9fWp1jFcFqsypn74Xl/uCst+OB5
	wG3PW4GYtcAwuGMGrnuNVbps3Gt5ibpK0i1dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s8kdzt6dBvc2nvJSE5NXe16skKnc3j9Vu5Y6uT8W0i4=;
	b=Z5Jcra4OD7rQnZoA84n97Dwrob0wdviZTURoxNphDsn6EIPQsZokJ7ciWA+siaTpHR
	ysBAibBsIXYJvRp2az7NsYCjz0gWb8XcCtv6VN3igfRxjXk8KIzrkfVUvRGI27yGiRyU
	EWkzi/HOU/SH2rO7qopRWabwCs1b2fQq3/ZJgINg+Zwe3wM2zKJlT1s/ms/W0BD20M4j
	6wfo8BEwWLXNVgzA2IQo+wN/hh5fNjnQpZjznUq76T/FtdXYY+9hOb7Ok701RwTiW+FD
	hqhU4TJHxY1wvvVpEiXYuI5jzPFrYL8N4ahaJDHP7Nx8XjkRrL7A69Yo4IuX7jASexh+
	zPcw==
X-Gm-Message-State: AElRT7EvE70SiVCoOuKO32FCLbRQM+BDs2r/8KAtKF2Idn6oV7kthWbN
	k15Y1e5VJCudg+G27oU9yEL5cu93OYPeR3Xcp2to8Q==
X-Received: by 2002:a9d:2ff2:: with SMTP id
	b47-v6mr11363428otd.316.1521731656005; 
	Thu, 22 Mar 2018 08:14:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 08:13:55
	-0700 (PDT)
In-Reply-To: <e5fc76bd-d087-fe60-1327-8dc476bc9fbb@lauterbach.com>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<e5fc76bd-d087-fe60-1327-8dc476bc9fbb@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 15:13:55 +0000
Message-ID: <CAFEAcA80qZPzfH662Pn6LJpstetBwt5k8-XZp6G3ncErf=o-Fw@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] ping Re: [PATCH v5 0/3] target/arm: Add a dynamic
 XML-description of the cp-registers to GDB
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
X-TUID: T+oTsNXhWnHQ

On 22 March 2018 at 15:08, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> ping
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33714

Hi. This patchset is on my to-review queue, but it may take me
a little while to get back to it because we're currently in
freeze for the 2.12 release and so things that are bugfixes
for 2.12 are higher priority.

thanks
-- PMM
