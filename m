Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4121146wrt;
        Mon, 4 Feb 2019 15:32:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib/WjkvgCuEljwpiuu0HxADhamdL0Ngq3YrOW3ooMdYNj1LBFtgfrii8dvQfNYVAxMGv2XS
X-Received: by 2002:a81:85c5:: with SMTP id v188mr1637346ywf.51.1549323177679;
        Mon, 04 Feb 2019 15:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549323177; cv=none;
        d=google.com; s=arc-20160816;
        b=dOH/UGdPqeEOITItc5r5dhmyglbG7k/3G2uWEM56cTus3yTRBmnmX63afZxBXJiSIi
         vOmtvfo9izyoCO8keNkk4JJqlOSFZdv1x7z9y+kgwevBqSrqlf/o3mgJ+Yu3jkAh8cC7
         7Za6QNr7sp6o3kfl5plG40m5ZzuXnkUy+BSBFdzOGA7lDiLPk/HtzW2kn9aqDyLZnfI5
         fgJo/NBsd3l9aFLcn5K5VPHiFXOnyLEsYiAw/Zhjnukr6jvqJL/nSHyccofzGsywXQ9N
         JoIr5i9XxGtbW1Z7iSyLIV9qmAaAoElzDksuU6zLBJg9G0TZ3c4chAzBtGAqRV5i2nxa
         G5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=tAcTGRF/wyEZHcc+X6FE4pwFwmX1GZq3T07X0d/BUbA=;
        b=PWYb2AgNoSKBUnGG96gvvVOUbXJzaktU6uZq4lPAxDACNJrahNX30+8dGs2pH6PwsO
         wO8b5Rq2Khp6x6f91tY9uUDkrTr1ulukT7VijmlYBzJB2Fh+7AkK2HAR+WYqG71IP137
         1ak14A3kunG6pdtSQJdlMtHGOLxTU0jdCfAI0UtqEX6W1lyVHStdvxR1BMMK6SxCkuao
         9s70M0ypPPyMhomLYfKmZElHim/fXJcOdCFRHfi5fMQMTBd2d+9CZsJszO2uML1c+Cuc
         3xmco0LSAPB5BBs4W898l5e9i8+iO+i44a2EJEQKoHCRxS5iCbZqaF41PUEB1UYwQjEy
         bfRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si292262ywb.345.2019.02.04.15.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnjV-0003mr-4p
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:32:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnjE-0003l9-If
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:32:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnjA-0002ie-O4
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:32:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gqnjA-0002co-Da
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:32:36 -0500
Received: by mail-wr1-f68.google.com with SMTP id z5so1718594wrt.11
	for <qemu-arm@nongnu.org>; Mon, 04 Feb 2019 15:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tAcTGRF/wyEZHcc+X6FE4pwFwmX1GZq3T07X0d/BUbA=;
	b=axPX9aZLwbHFzvkKBnVkRrVuK/Y8bU3PnZ1+tOed9pjkZx24vEYrCEcDYUBzGJKqa0
	RtN57xl1XZop17Vr9uC0dAzkjOiMJcHQV0WG6/pwrY/VLlxof9FtVHENd4KCSMgI1FDN
	uSTVvhpE5S7ugcQNbrMXxf0+okm77/bqEGKZr6mLuC3YDGrLK6AFzkRmjOtM1x7zlMfG
	OGrA3TwnK0wArE/yAuIabJRC+UhorBQLXwBwIe6v6efA5B8r22BeKGZcVqw7GoBZwxl2
	ZMfRpZ2b6pB3OZ00pblIZisNGxakFnOyoQDVclCHRGO0OXyOnoYw4QRWoGZRCT+wOl2s
	Lkfg==
X-Gm-Message-State: AHQUAua+tbwfa7FD1XYXtQHkxsc+wA2McOdtKpFLJxzPwn2j1GmggoNv
	OTLSq35c3H/xK/p/zM6uIFhD5A==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr866041wrp.74.1549323147374;
	Mon, 04 Feb 2019 15:32:27 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	i192sm12438562wmg.7.2019.02.04.15.32.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 15:32:26 -0800 (PST)
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <154931335810.29184.7999220470596987389@ebba9967afc0>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <add6e25b-d3e8-e352-6a0f-2457555f2dfd@redhat.com>
Date: Tue, 5 Feb 2019 00:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <154931335810.29184.7999220470596987389@ebba9967afc0>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/tsc210x: Fix building
 with no verbosity
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
Cc: fam@euphon.net, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	patchew-devel@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DiaSfW0SDJ1J

On 2/4/19 9:49 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190204204517.23698-1-philmd@redhat.com/
> 
> This series failed the docker-mingw@fedora build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> time make docker-test-mingw@fedora SHOW_ENV=1 J=14
> === TEST SCRIPT END ===
> 
> The full log is available at
> http://patchew.org/logs/20190204204517.23698-1-philmd@redhat.com/testing.docker-mingw@fedora/?type=message.
> ---

Full log is weird:

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
From https://github.com/patchew-project/qemu
 - [tag update]
patchew/20190117215300.29694-1-brijesh.singh@amd.com ->
patchew/20190117215300.29694-1-brijesh.singh@amd.com
fatal: Unable to create
'/home/patchew/.cache/patchew-git-cache/httpsgithubcompatchewprojectqemu-3c8cf5a9c21ff8782164d1def7f44bd888713384/refs/tags/patchew/20190204204517.23698-1-philmd@redhat.com.lock':
File exists.

If no other git process is currently running, this probably means a
git process crashed in this repository earlier. Make sure no other git
process is running and remove the file manually to continue.
Unexpected end of command stream
error: Could not fetch 3c8cf5a9c21ff8782164d1def7f44bd888713384
Traceback (most recent call last):
  File "patchew-tester/src/patchew-cli", line 521, in test_one
    git_clone_repo(clone, r["repo"], r["head"], logf, True)
  File "patchew-tester/src/patchew-cli", line 48, in git_clone_repo
    stdout=logf, stderr=logf)
  File "/usr/lib64/python3.4/subprocess.py", line 558, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'remote', 'add', '-f',
'--mirror=fetch', '3c8cf5a9c21ff8782164d1def7f44bd888713384',
'https://github.com/patchew-project/qemu']' returned non-zero exit status 1
