Received: by 10.25.21.96 with SMTP id l93csp1903476lfi;
        Tue, 21 Jun 2016 04:54:14 -0700 (PDT)
X-Received: by 10.55.129.135 with SMTP id c129mr29520400qkd.174.1466510053925;
        Tue, 21 Jun 2016 04:54:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16si37719993qtw.100.2016.06.21.04.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 04:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFKFx-0005QP-C3
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 07:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKFt-0005PD-Qg
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:54:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKFs-0001Pb-0S
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:54:08 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:32944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFKFq-0001OU-QC
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 07:54:07 -0400
Received: by mail-vk0-x232.google.com with SMTP id d185so16844027vkg.0
	for <qemu-arm@nongnu.org>; Tue, 21 Jun 2016 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lxN1o1PfxxPYM8z5Xw2Pai0GS6NpHGalqYyUCyZXCIM=;
	b=a4WL38kc15uTi8FCPq1tXIZUOKTnXonoetwSugL8zgCzVlglcGpHKuMQwWmNozziyb
	ZP0XwDlfMHfzHtb5PBHB9LK0ez9z45BaokFW+pymApY7S6U85H4eXuBnFjb+RSoXN2qi
	BtXXlAu0whm0mN9b2YhV815L6mjo7d4YQnHYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lxN1o1PfxxPYM8z5Xw2Pai0GS6NpHGalqYyUCyZXCIM=;
	b=JBTBKzm0+dCLgeYxtfW3Ta4wmB7mHHtq4nOq7kUG1/BTxyNSTKdbSaEy3Ur7I4QVOf
	LKJJx0fWWG6xRahN3d3PpIwtf5Q3/afLJrqOijNzQv6xwDaSLNRyvhW0zIKd0sR4RtLG
	kop6Vxi3Kqc8mwN8Wo4ZPsJjplhKFArLrsEjXsvaWIl3leeF9qljaBK4T78/tJJzJACr
	0tTCY52S/P+Groht8Xv7VzEpYhyiC8noc6UuskrFEnlxvb8WRzQ/n18yxOwJK/ulKw2Y
	AsC6xGmFEQKeutKR3EPGORG5kOlHIlONkfreN1U1PZ0fVnvZUEUF96wCEbzkRVuv4Hy/
	XbUg==
X-Gm-Message-State: ALyK8tKDVJIAMy9IhlhSmMP/zHoKML0+782/nvYFqNSEOV9DyAm2KxbfWoUbbDPuoB1H8Uwdo3+6Mcfcm6WlSRze
X-Received: by 10.176.0.145 with SMTP id 17mr9005228uaj.103.1466510045979;
	Tue, 21 Jun 2016 04:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.50.140 with HTTP; Tue, 21 Jun 2016 04:53:45 -0700 (PDT)
In-Reply-To: <16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
	<16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 12:53:45 +0100
Message-ID: <CAFEAcA_A=f0H3DkquozZKKVs4A3UR+fEhE9wfwe8zDHrsprEyQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23sGFCpyd9nf

On 13 June 2016 at 10:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -4044,6 +4044,9 @@ int main(int argc, char **argv, char **envp)
>>      }
>>      object_property_add_child(object_get_root(), "machine",
>>                                OBJECT(current_machine), &error_abort);
>> +
>> +    init_l1_page_table_param();
>
> Please call this from cpu_exec_init_all instead.

If you're going to call it that early (ie before machine init)
than I think we might as well just call it from the existing
page_init() function in translate-all.c instead, right?
(gets called when the tcg accelerator is inited; we don't need
to set up the l1 map if we're not using TCG).

thanks
-- PMM
