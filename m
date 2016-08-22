Received: by 10.25.21.156 with SMTP id 28csp1855086lfv;
        Mon, 22 Aug 2016 11:06:17 -0700 (PDT)
X-Received: by 10.237.53.157 with SMTP id c29mr25693937qte.75.1471889175929;
        Mon, 22 Aug 2016 11:06:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123si5335164qkf.103.2016.08.22.11.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Aug 2016 11:06:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bbtbz-0001Pe-Ao
	for alex.bennee@linaro.org; Mon, 22 Aug 2016 14:06:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bbtbt-0001OX-CZ
	for qemu-arm@nongnu.org; Mon, 22 Aug 2016 14:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bbtbq-0003Ct-4V
	for qemu-arm@nongnu.org; Mon, 22 Aug 2016 14:06:09 -0400
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:35694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bbtbp-0003CY-Vk; Mon, 22 Aug 2016 14:06:06 -0400
Received: by mail-it0-x243.google.com with SMTP id f6so5371215ith.2;
	Mon, 22 Aug 2016 11:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JfQwrTqYDZ6e5DtqI+ouhXCt1qBvOEuShZsEmr66/Mk=;
	b=zdcU1/0R3wzBe25yPdqi5N8/+3zGEZHnj5XqECF2LUYkcRMRoKppLa8sRLaapBuwT/
	B3HpNKaOEIX90YphQvG6XdZkQAK0ytSSxYdqq5kleqOEV9PanzpsX5qw1qRbA/2T8NPG
	0yBkOYhSvALBa+H8/oqtTrDbh0Nfn3CI+o6PNwGG4oflTDJH+CpicardhCj8OyDDjRu4
	llEFp95Lv2ocy4x8UHorqIBVPNp2VW5QtFUzV/l+2B9wh7tjTvG00XNPY6S2U6MYBsMJ
	Ft++t5lIHhLu2rLOKMMlpiKeOwvSNcCPCdWWXrpAm6XSFw4JNA/jhwk3J4WdhMJZYk/s
	3O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=JfQwrTqYDZ6e5DtqI+ouhXCt1qBvOEuShZsEmr66/Mk=;
	b=KGP9nTR+U4K95AEauNVqX9YjXDoaIfHz6aXf9OuDJkBtB9YcslZAJbN511NUKkc9Fd
	kUUXKRLCgpjHCzneycj5wUwch/MPvtMmnGZtDx11aed3j8D/vW8DiRBopwwFGgHzicoz
	44jkxBmTlro/iixjbST944KFcplQhNOY7hRL0WKFFRbTj6MYQVdbOyFyQ9D4USEp5caj
	4P+N5OXE61VX1/szXZn5IVSOO5X9wF2G9PQWYW3yP7ElUvLBafHeYKp3CsqGICMH5vQp
	7mdg6R8eqKr6xhf0qRTPtGC8IeKQUM98UDMdYrJpaNnqc8YWeCw7cdkH6cZB9Eu7Jwfd
	4cww==
X-Gm-Message-State: AEkoousQvk6zcLDwV1sdjS81Ta4FP530bIzM6eHCpO4+C5h9QqhtRvwX+Kbq0FZKMXY4Xw==
X-Received: by 10.36.46.136 with SMTP id i130mr20577486ita.62.1471889164157;
	Mon, 22 Aug 2016 11:06:04 -0700 (PDT)
Received: from [10.0.0.102] ([173.243.43.10])
	by smtp.googlemail.com with ESMTPSA id
	v11sm9387037iod.43.2016.08.22.11.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Aug 2016 11:06:02 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
	<20160819141930.GE2004@work-vm>
	<CAKmqyKPPg7rfuhHNrRzZAjpx1JKFME-LUrEv2WMZyVpzQRVJ6g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <95cd01e4-12e7-12fa-5f2a-f1d7de0b2e97@redhat.com>
Date: Mon, 22 Aug 2016 20:05:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPPg7rfuhHNrRzZAjpx1JKFME-LUrEv2WMZyVpzQRVJ6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::243
Subject: Re: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	"Krzeminski, Marcin \(Nokia - PL/Wroclaw\)" <marcin.krzeminski@nokia.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	rfsw-patches@mlist.nokia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eno8GUfEVAdw



On 20/08/2016 00:20, Alistair Francis wrote:
>>>> >> > Change wrong name of the vmstate structure. Since this breaks
>>>> >> > compatibility update version and fields to 0.
> s/and/set/g
> 

Or more likely: "update the VMState version to 0 and make all fields
independent of the VMState version".

Paolo
