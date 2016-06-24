Received: by 10.25.21.96 with SMTP id l93csp971011lfi;
        Fri, 24 Jun 2016 03:36:16 -0700 (PDT)
X-Received: by 10.55.207.74 with SMTP id e71mr3759181qkj.64.1466764576450;
        Fri, 24 Jun 2016 03:36:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si834195qks.199.2016.06.24.03.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 03:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGOT9-0007tT-TA
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 06:36:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOHU-0004Gr-0q
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 06:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOHT-0003Tq-6k
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 06:24:11 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOHT-0003Tc-2m
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 06:24:11 -0400
Received: by mail-vk0-x230.google.com with SMTP id j2so144136740vkg.2
	for <qemu-devel@nongnu.org>; Fri, 24 Jun 2016 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C3pwmKOV1mh7z6ruL9ZiW/+IfFBWyPLQBe08P4q1hz8=;
	b=ABfPacULEUwFB8uBLegTCBjk+r28KYUClsZtHVTDlsv/f0RGDmVrCvSQljeBHe1HJZ
	UY2gWdJpXxqGrn1fv8h8GAQlE/p0DTnq9BBLP1wgr5j+oYGHd0zdF6xAv8OJFAWc+pZJ
	M8N59ifreqYeUvF06KKMfsK9pbXji2za+URuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C3pwmKOV1mh7z6ruL9ZiW/+IfFBWyPLQBe08P4q1hz8=;
	b=QvUAlmgsb8Tmc7ftrNUD8Gu7fTfFLTsQnvhUO03eTGoWXwyViYujDOj0mXJAj9W0H3
	i3JR2YghWNlhJgPzNGh7h0deKQGDuNYDLP1a9JRkw/k0Krb2bqYkyZ8zlTW8jz0iZKwm
	YNlDlMYxULisGoTA3Vab/XuUbaxnNO57VTFJZGMbtaoEynLC08Nxi/TsH3snQoTAIctu
	j7YmxwwM6yOXB+FqVuKoltIVZ2Su1ATN8LkzaWPExciEAQ69/unPTgXhB/3/YwvdGlGP
	Z8vI3TbMrJVq3shrtrUHYvUyRjMlIZrhEJGLjrFmfJ+zxNu4HMiihrpCKpIGObswLw0S
	gjfA==
X-Gm-Message-State: ALyK8tJ3WkxW4fvTlJMfunHKWudqKYXaa/OyKkWCfje+w3DK9j7qimwOze1yyKMBxKEC8ovxxCmIBZ2HcsHecNiJ
X-Received: by 10.31.188.80 with SMTP id m77mr2076789vkf.30.1466763850645;
	Fri, 24 Jun 2016 03:24:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 03:23:51 -0700 (PDT)
In-Reply-To: <1466760306-21849-1-git-send-email-thuth@redhat.com>
References: <1466760306-21849-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 11:23:51 +0100
Message-ID: <CAFEAcA86SjBfqs=phULxX=SsySqgmoDyKJJtVSHnrpfeoRO+YA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-devel] [PATCH] arm: Re-enable tmp105 test
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wgn4df6qfY5y

On 24 June 2016 at 10:25, Thomas Huth <thuth@redhat.com> wrote:
> The tmp105 test is currently not executed since the following
> line in the Makefile overwrites the check-qtest-arm-y variable
> instead of extending it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---


Applied to target-arm.next, thanks.

-- PMM
