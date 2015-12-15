Received: by 10.182.158.201 with SMTP id ww9csp2557822obb;
        Tue, 15 Dec 2015 08:54:57 -0800 (PST)
X-Received: by 10.140.31.37 with SMTP id e34mr52321884qge.28.1450198497815;
        Tue, 15 Dec 2015 08:54:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si1873641qhd.81.2015.12.15.08.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 08:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8ssL-00024T-IL
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 11:54:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8ssJ-000235-A0
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8ssH-0005Wh-Bz
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:54:55 -0500
Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230]:35160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8ssH-0005WQ-4b
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:54:53 -0500
Received: by mail-ob0-x230.google.com with SMTP id 18so11345684obc.2
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 08:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sZAfw++AhEqF2UaouWE00lEZcmgIKsjIkYaFzaPxPQ0=;
	b=NFCrnH+aUX5ly1S2S6QfRaZJRX85KpimnFUbo41olizPgZxiW4SWsev17hyk8Q+v6o
	9cDID+v1l6dKLWFphAUbApCUteUtQ6ksHjajmNv+LTRdBE3QM/dTS+db4ox3XWy+VFj1
	nSKxM5ByhSBsA888kznZQfbwqp4cBcl3SSFvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sZAfw++AhEqF2UaouWE00lEZcmgIKsjIkYaFzaPxPQ0=;
	b=m/FQ8XK5CqEFQfS1eBsKWjiMvzUO9H/Gt1XHgATc6DeyDOZD7Qk4i4GwZ7vNeAw0rl
	9P/KO/ainzHKhLPQVrlv6EGbghpys24FKqg3glXo9HTzi6SfyFs4KiIbbaVoAhtoN6Ao
	7+TpwdtQ+rVIpiIBilM1TM4nHIRTxwzZijAvGGtJWL/jND9txqjkQFSIwnFZZ545zvk7
	0trSi7WArwgFwDg0QEg0pZCdSXKZzEmD+EbFKsAYYtN73rEj9NxWp6PB1UdTST3MGsTC
	j36RRB5dhi73nD/+XvZoqWwhMssMCPHkNKCFfBXTyQNNHLokWhuPrOfKfRsRN/pUTQM4
	gFSQ==
X-Gm-Message-State: ALoCoQmr+sju7Ek+HF/P6fUJqVev7XPX4qBaEBvbZSVGtmW9aCbHWHhDIo3zS+kE7kQUB/mopMzLZrK/nvTch4PnEL8CFTb6ya747BEAOeV3QS2N+OwFlK0=
X-Received: by 10.182.61.66 with SMTP id n2mr14432736obr.11.1450198492550;
	Tue, 15 Dec 2015 08:54:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.52.97 with HTTP; Tue, 15 Dec 2015 08:54:33 -0800 (PST)
In-Reply-To: <1449804086-3464-2-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-2-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 16:54:33 +0000
Message-ID: <CAFEAcA9LE_eXQF-RfuQ1_qS7yO2kP9BBwR7rBkwVq8pRUZHS5w@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::230
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 01/10] acpi: support serialized method
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rKnme3fuaWOo

On 11 December 2015 at 03:21, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Xiao Guangrong <guangrong.xiao@linux.intel.com>
>
> Add serialized method support so that explicit Mutex can be
> avoided
>
> Signed-off-by: Xiao Guangrong <guangrong.xiao@linux.intel.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

Shannon, this patch needs a Signed-off-by: line from you,
since you're sending it to the list on behalf of somebody
else. (You can just reply to this email to provide it,
you don't need to resend the series.)

thanks
-- PMM
