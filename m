Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1151725wrx;
        Thu, 28 Feb 2019 15:28:22 -0800 (PST)
X-Received: by 2002:a5d:474f:: with SMTP id o15mr1305518wrs.70.1551396502528;
        Thu, 28 Feb 2019 15:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551396502; cv=none;
        d=google.com; s=arc-20160816;
        b=hSmtD4FRlmF0Odw26QFKhJS9aPGl01s7T/mPiR7+4P7emAhtAuEJ0o8THUdxFxTOol
         iYNIp4FMGvl1/RlMltbYx5wD+blradPOf4OJZXzCMp14qIvj3tEsmoVLo2TJmApp9g2R
         Zk4i+c24yk3aOfM0Dmm5cbThqMDO3HP/q7jr1GwMmZZmScTQ8AmHinha/kxHiDeprwLL
         zLbB9hCKwG6OqgeFbr+gAuVI7hXlwfLfi8iyfPXWiAzJV4Sd1hsfreoVUY1p5T2u2sIf
         rvNtW/iV/szvMBYH1OIxbRL6wo/Ya3i4+6TcTBS7sMcjUcqgcJMYd4Qa6J1VlvWuuiWO
         aFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=h9jVCQsB4tARWZjQGcMFm92MOXElUeKeVVR9SGPqjd4=;
        b=XGHjqXI6xGae5BZOltFh7NnOkMxuidI2TrcjIshpAAbQmmJcTPQTVeSRyW3WATKBOh
         38RheHqRN3la8ZVDz5GubZ9YM1g5uaZPVjJhrLvzWpqmV0POUCVM+QdQwjJh8FlU93eS
         sgP1Aowia57f8aB74bg48md3jP2+49VJg6or2nfwI5rLHD9qibD5gM3F1OZDdkep0oDW
         f2RMVGuRMVCQtFIJjQvF6KS9qPdaWbPk5csVXyjwF4drKzntWXHDBsMMGi/Qej8BH8WP
         s2jBNzD/l9vrcEyjbhqq4TBRTZdjWGep+TlJ/+NIbUFfW/8SGawQkeRnADYU+ztS3Ela
         ogcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b14sor14663584wrx.20.2019.02.28.15.28.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 15:28:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h9jVCQsB4tARWZjQGcMFm92MOXElUeKeVVR9SGPqjd4=;
        b=ZWTAgiMpMYZ5japjLihkxPvdrLtX99Vir3ohwONyxJyF/++Hd8VTPjE/rXzHoYtGmo
         5P3GSACu125N5ldF7/QY1R1rY8PEw6ZMAMHU6dj8W9JJqyVUAON5cqD2J72gy5J/JJtU
         JQVYa2X9ko4pZzWV+CzhFyqRDc+rKywwa8JfSvX1pZs9ou/jbQMSDBKCeqSehJFb5e7s
         tVCsY4auKhCDHzdhuif8PpEfydo3NDoazzNu3zQ2dqY7T3j2A7fduIrh4tr9IlJQvY9k
         pwNqpeoBbzJpzdiwdU8bIrpwy3rgpTZx94V4GpEPwilXIdaNM6MfzRXgPujHZYDnqL+u
         i6pA==
X-Gm-Message-State: APjAAAVBDqt9AmjogglyaKOeCAYURnXNQyhC5o4QjYL5DeT+DtM8uwZa
	V2qkXwOLRinq3H8mpSmyhWcbFir1daZ2rA==
X-Google-Smtp-Source: APXvYqwW/ByiDM1B71mCJxIs8gaAvtLwUEHtB96td8cpwd3qEr+tUgzz/+BsyxU1/+LTp/XZQUxLCg==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr1248437wrp.148.1551396502291;
        Thu, 28 Feb 2019 15:28:22 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net. [88.25.181.43])
        by smtp.gmail.com with ESMTPSA id g81sm6923894wmf.7.2019.02.28.15.28.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Feb 2019 15:28:21 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 07/16] tests/tcg/xtensa: enable system
 tests
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
 <20190228202537.4638-8-alex.bennee@linaro.org>
 <71a55c0c-3c09-edea-82a5-63fb0cfb4f12@redhat.com>
 <CAMo8BfKvQZyp3ri356LoqCDhsFszU5proLGH2MBbBi2pgRZ4rw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a845da4a-603f-a469-77a8-028c5a5d2063@redhat.com>
Date: Fri, 1 Mar 2019 00:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMo8BfKvQZyp3ri356LoqCDhsFszU5proLGH2MBbBi2pgRZ4rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +CzCAYcZnkOK

On 3/1/19 12:24 AM, Max Filippov wrote:
> On Thu, Feb 28, 2019 at 2:54 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
> 
>> BTW is this simulator downloadable? I see the Zephyr project also uses
>> it, and I looked for it on https://ip.cadence.com/swdev but couldnt find
>> a (public) link.
> 
> There's a site https://www.tensilicatools.com/
> with tools for various end-user-programmable xtensa cores,
> but I'm pretty sure that neither dc232b nor dc233c are available
> there.

Thanks!

Phil.
