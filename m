Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1494420lfc;
        Sun, 21 Feb 2021 22:25:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMWbe1QnjESQ1yLQ+Jc71qXSWVq52uwD0HA1Our3l2C6FU9e26j9zBcy2vql3D/OvAIzJp
X-Received: by 2002:a17:907:20bb:: with SMTP id pw27mr19682339ejb.71.1613975116950;
        Sun, 21 Feb 2021 22:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613975116; cv=none;
        d=google.com; s=arc-20160816;
        b=IIgEMioJSyXXXYMmYXZhCm1cUzbr8yxIqvAz/MhOKKghw+iq9LKBBNCZ9AGpXP+NKk
         OdNmZLnQ9PGSaPBlDWv+BLeEvhiG5epiDaSXNnFzpxYCSyhouBdbNjyYoqPvKS+Upq8Q
         XJvjsbEFvPFpUJxmlQGyR58a8iy0y85jfJqTtqMtNsyl6sXXtT+rTpfFT4tXDSVDfI6R
         cMmLCbW8oYbWqzzWdS2DHyRerANLcuQCPzPIOEEKsKNL+YcUW0Ga8UAdXUTzraThBNd+
         7qYOsqiN/UYOcTgYEwzKXsifbSJmrY/WFJBKIV/svwbd/5sKMp6785p3cJXciDv/7wjk
         umYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=FrP/kX3ijmfe55YfoTdgXXt4u7STZMnDlito9XvcNpc=;
        b=ouYoKp9DpyWGTWP9bsryPwdIDarcUV07QacI0MWWXfnoia8yBaD8wjX5nbsLn4hyQA
         ASDBgjbU4EiBSLtIJ9Dp0kZRlSnKsrOIVacuK0t+NVXlo/7ziJ5Oi9QtIaXh6hx7PUhg
         dZYZjT3x/kPu/G/NHfIAuuD6DgEMjbaw4HsgyGPsBRpRelugo9mI4Ub6/FrcTvbPmDDA
         RvwLnbTvao29qfEi/awnscTrndT4gWAcPSEvO333a3OX5uvStkrbPiBOBCaf2pm7qTMj
         fsxHW6pbwOkZb+ScHoaI9E762AY7s/CpHvVWCAVisGiAwsupYUagAf6orzL+UOWP6iMN
         EeNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IalWu5Qd;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c14si4820615edn.428.2021.02.21.22.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Feb 2021 22:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IalWu5Qd;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613975115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrP/kX3ijmfe55YfoTdgXXt4u7STZMnDlito9XvcNpc=;
	b=IalWu5Qd3Cx0mFnIsy1Cjj60EHIBnIr3pa2dolwwBV4V0Qu1SWOcnoilgKdxRLVZV3rXQj
	sHdEzk9jUShGxFb7VLvN7EjdwgI8yP35a+YpOk619SkuFYabrT9jJ6mcld4bImaVJnB5O2
	GThdzmFLioSDk47HBeSpvIxv49d1/T8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-99PIHTAMNZCVhMy7uqfdsg-1; Mon, 22 Feb 2021 01:25:13 -0500
X-MC-Unique: 99PIHTAMNZCVhMy7uqfdsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C53107ACE8;
	Mon, 22 Feb 2021 06:25:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-97.ams2.redhat.com [10.36.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B55B87095B;
	Mon, 22 Feb 2021 06:25:10 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
 <CAFEAcA-yLQNLVUPZPRnTTNupkUrgcTRHVR=SW1Yb6KEUeQjkoQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: tests: n810 arm failing
Message-ID: <85acde21-88ac-1925-b6f8-ce12c649556b@redhat.com>
Date: Mon, 22 Feb 2021 07:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yLQNLVUPZPRnTTNupkUrgcTRHVR=SW1Yb6KEUeQjkoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eMdGXJUceMgY

On 21/02/2021 20.33, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 17:26, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi,
>>
>> The n810 arm test failed on latest master:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/
> 
> It passed on the gitlab CI run on the exact same commit hash
> as 'staging' before I pushed the merge, though...

Looking at the following run, it failed with some timeouts as well:

  https://gitlab.com/qemu-project/qemu/-/pipelines/259425956

... but in completely different spots. So maybe it was "just" a global 
slow-down in the CI farm? (Which sounds somewhat worrisome, too ... I hope 
gitlab-CI is not going down the same road as travis-ci.org did during the 
past year)

  Thomas
