Received: by 10.182.158.201 with SMTP id ww9csp2620695obb;
        Tue, 15 Dec 2015 10:42:25 -0800 (PST)
X-Received: by 10.140.89.241 with SMTP id v104mr50444728qgd.36.1450204945304;
        Tue, 15 Dec 2015 10:42:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r129si2274900qhb.44.2015.12.15.10.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 10:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8uYL-0008EZ-1g
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 13:42:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uY1-0007wP-0L
	for qemu-devel@nongnu.org; Tue, 15 Dec 2015 13:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uY0-0001A7-7Q
	for qemu-devel@nongnu.org; Tue, 15 Dec 2015 13:42:04 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uY0-00019w-37
	for qemu-devel@nongnu.org; Tue, 15 Dec 2015 13:42:04 -0500
Received: by mail-vk0-x234.google.com with SMTP id a189so11552116vkh.2
	for <qemu-devel@nongnu.org>; Tue, 15 Dec 2015 10:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HJmFPA4s/EMW8/RMDK50fDsJo6OGqZP/FZ9Xf8VIEjE=;
	b=g/qhxwDu4ncMs7GuWfGLygDaJou0KnGmeecxfSIvu6+QSo96ljWtrZo9a3JejoBger
	fcvfdcsdtGtqX8Zs9KfaWDSBemFoyO9BEco6yOgbk1USaT8gRoMeoNh82IyODiaVJ/BD
	WYjUXHel7di0FhIrLXKP1Jt++Sj5tK6yPn4E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HJmFPA4s/EMW8/RMDK50fDsJo6OGqZP/FZ9Xf8VIEjE=;
	b=F1w4yVpZFX6bDLMXSwCUJExCkQ1IbpJfBCNPThxY1Nm9ARxdHGtuzdywA0R/w9xAjF
	vp+jIciFGBFIBE6mLEghPImBGlxPfvP899buq4O+5xNabvmTGX4kxqofRNORXngYhQIz
	uEbxoZyAVrks1KzwBVli2Ml+slljq4KIw95Q8DNnp8FWShi6UQkQgs9Fle15IUD8o6e3
	ZkQuchlWOL0Ld3Nv7ef0QwTZweHxXUiMYqzclnPIqHf+Fw45YtlCP0/eXe98yBzG0VI6
	0Ub1rTnU2f9wOIW8WvZl8Wnu9xw6MkOChzftQgCK2i4ghiEM71sTM+G1mcB6kGyj9KZo
	sJUg==
X-Gm-Message-State: ALoCoQkZf7NAG9Jkk4o7PrSC19YCy5wgrkk5om0YvDhrfzihDcuCBZHuxo83AKOU/vSAtCEALks+kOpJkoXh9IPEW6hZe0ocxU8BcQ150gLbqL4FrNd179k=
X-Received: by 10.31.131.203 with SMTP id f194mr30317729vkd.90.1450204923657; 
	Tue, 15 Dec 2015 10:42:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Dec 2015 10:41:44 -0800 (PST)
In-Reply-To: <87h9jkltn3.fsf@blackfin.pond.sub.org>
References: <1449764955-10741-1-git-send-email-armbru@redhat.com>
	<1449764955-10741-2-git-send-email-armbru@redhat.com>
	<20151214165537.GB3774@thinpad.lan.raisama.net>
	<87h9jkltn3.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 18:41:44 +0000
Message-ID: <CAFEAcA-2JmYmb4mvXb=LPwN=-RzT4nBV91gDAMyJ1wK1q1YcMQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 1/2] Use error_fatal to
 simplify obvious fatal errors
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vzbcgqUwbvto

On 14 December 2015 at 19:25, Markus Armbruster <armbru@redhat.com> wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>
>> On Thu, Dec 10, 2015 at 05:29:14PM +0100, Markus Armbruster wrote:
>>> Done with this admittedly crude Coccinelle semantic patch:
>>>
>>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>> You can rewrite the semantic patch as:
[...]
>> Coccinelle seems to have some magic to make "LIST," also match
>> with an empty list.
>
> Same output as my script, except it doesn't mess up zynq_init().  Sold!

Do you mean by this that you're planning to send a v3, or would you
like me to apply v2 to target-arm.next?

thanks
-- PMM
