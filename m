Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp945472lfp;
        Fri, 24 Jan 2020 11:14:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrN9qva9KsNIwtAJ0C+63f6S0688Y9Mo4RmgXjnD8iQcga1EQqNoeZV0b2jlWHwtj9cfKL
X-Received: by 2002:a05:6e02:5cb:: with SMTP id l11mr4348007ils.307.1579893272472;
        Fri, 24 Jan 2020 11:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579893272; cv=none;
        d=google.com; s=arc-20160816;
        b=lHPgZhPq7Cjdl/S0935QMPuR8sXMFpeTlSmqyOkeFVKNU/CptKJNWktWupqhqxNOu4
         MeXbhERjnxGazrvobfDSpuRemc+szUB3JOAa3s/djpEKk0Ot/FNGxc6qN5A8OKYEK+Xw
         lp4brJK3eaheDIYjrZxqjZ8aSo5loFO/1je54elPKcKeMuDhrivELbhpDvJ+WFDDO98O
         aZidPqXH2K9dtq/297MwtG4yuLWbby5A/VBsewGT4XXys9F8yX17BTR1keFH8vg1veAC
         kJN0JYuq6GwgkQLxRG2aTupZuTXAIBVW1OTsA+TUXsc5zaSsqSBPH9mAnRtr7Ouwf/MI
         zPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aphHIKS+HxyX89TcvbfoeV/688kxWJiT89qFcIyE/nw=;
        b=Sec7hGataJ1uICQHZeaPwdqXzRVw8N58vmr2wv7LOUAMjNHUPZMx7fpGSaBVVUA5Vp
         fqpxYEz2/eOysWeTn5A1MquwH1I7lzWmayzn7l50yVLGGvTsoXKcX3jRWS2OFeVpp31V
         dHs9xZUXcf/XjzWrzA8Fa2FRW96vI+ZxzlmFO9WcRLpL4qsZysQEsiP64HJB2eSqT/AS
         32GCwV91VBk3eHS8S4fU8Xi2K/DVC1n191Pkl/13VDDPDDmkbm5u57lmuJwdtEOA44ly
         dztQ+pwbXXvLAnHAiojml/8tkJghYlBuEK4Vn1qqVnOYk7ZshiyGNRALQDSYjsNr2JC/
         p7kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2019-08-05 header.b=izZqo4r9;
       spf=pass (google.com: domain of liam.merwick@oracle.com designates 141.146.126.78 as permitted sender) smtp.mailfrom=liam.merwick@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <liam.merwick@oracle.com>
Received: from aserp2120.oracle.com (aserp2120.oracle.com. [141.146.126.78])
        by mx.google.com with ESMTPS id g9si5041739jaq.65.2020.01.24.11.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jan 2020 11:14:32 -0800 (PST)
Received-SPF: pass (google.com: domain of liam.merwick@oracle.com designates 141.146.126.78 as permitted sender) client-ip=141.146.126.78;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2019-08-05 header.b=izZqo4r9;
       spf=pass (google.com: domain of liam.merwick@oracle.com designates 141.146.126.78 as permitted sender) smtp.mailfrom=liam.merwick@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OJDITf091426;
	Fri, 24 Jan 2020 19:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=aphHIKS+HxyX89TcvbfoeV/688kxWJiT89qFcIyE/nw=;
 b=izZqo4r93PTQkDv2ZuL+TUkT4sLZhxtvaavGqaOt/gyChpLQTFCesVZl9zah/AMVlNDo
 o9ldNVaFu8z6SxLrNL+YxG1Q2pxSvXZXIQiAusoAyzEybWMeW8hJBQxC9ukjp5v2kWs0
 9LIpJXuVfIohrrQarxP7rba9JxtZaQAMTEJGqjV+mUYYqYrxPRImXZDRv4umeJOyRsY3
 4A836SzKxkd8Pwz132h8MJlQ40ukScuxAAdNAoKAe9zxUx26jrfNw7IEMk0H4wY6oCzL
 EBANz7fBHnLitR/XB5AtK4Y2jacjy87wFMlh0fMHLCbLJFv3Ycsk+0nGYOEmcFdE8aEr JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 2xksyqtvhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2020 19:14:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OJEFXU175378;
	Fri, 24 Jan 2020 19:14:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2xqmufn5jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2020 19:14:29 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OJE7GU015287;
	Fri, 24 Jan 2020 19:14:08 GMT
Received: from [10.175.179.249] (/10.175.179.249)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Jan 2020 11:14:07 -0800
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        liam.merwick@oracle.com
References: <20200124170325.30072-1-thuth@redhat.com>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <59b4d74b-c09e-3c8a-e4ab-015ec405f545@oracle.com>
Date: Fri, 24 Jan 2020 19:14:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200124170325.30072-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240157
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240157
X-TUID: nGxppbtjUJYS

On 24/01/2020 17:03, Thomas Huth wrote:
> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
> for various non-x86 machines. We can use them for a boot tests in our
> acceptance test suite.
> 
> Let's also make sure that we build the corresponding machines in Travis,
> and while we're there, drop the superfluous --python parameter (python3
> is now the only supported version anyway).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Liam Merwick <liam.merwick@oracle.com>


> ---
>   .travis.yml                            |  2 +-
>   tests/acceptance/boot_linux_console.py | 96 ++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 1 deletion(-)
> 
