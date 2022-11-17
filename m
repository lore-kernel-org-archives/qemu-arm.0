Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1278672ejx;
        Thu, 17 Nov 2022 06:01:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7At/+k8xLvRqFAHl0FJh5b5u+nMMu1YSkuh0+NOOlx+LMUqf//VYXBfR2ccB7qht9Rt4dP
X-Received: by 2002:a17:907:c016:b0:7a4:98cc:7c8e with SMTP id ss22-20020a170907c01600b007a498cc7c8emr2238014ejc.48.1668693701749;
        Thu, 17 Nov 2022 06:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668693701; cv=none;
        d=google.com; s=arc-20160816;
        b=CQBagL4WzjD8Vn7gM+Cbo7UlyMOYlNnejN8kLMhddgnf5nAs3EtcvTauQe1x1nkSbo
         xtBvTZDSl6Fw9IJPphmmnsB5iczPUybClwT1vaFtXdHnEQI0L+XD395RHXhmiB45uY3n
         EvXAxaxRHQzIkYWSVOhn2Vn+c2SeZ1r9CJFaunfDEa8KWApOUB0DmuwQcHs+D6mOFgD7
         VASdX5Wg+oGczt4gC/MxKqrb+cuVCD9eHV9ff6yEGLDS9f86rg5KQ2OAdlAG3RMzXztu
         i3it3P4plkJG5J4+LpTD9gb0B8qrQVSbhtKLe4dIadyQbGIGQB/sXld1Sbx9RGj+5cWZ
         +6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=tYCNi8aTBNQGFX0N6hMYLcRuoK+1KrW9zCSzQ+V9Z1U=;
        b=MS5m9dGtFJioNCW3uUPhOuTAhgiOwyltPKqwEP+sGDmXvIAprKcfRMCa8eE1XasPuY
         kWZpk0homTgmHL89xk26qoEF1hgKmJYhkyeSdTphTiz2oN5RaSMfskyHNy8tflmfqVNG
         Hfgo0SuPB6BF+oUd02OkEpaz/hiUBitoXHT4pJCw7kC9ieMtHoaZuKUCCYmDzt9jcN8V
         p7l0T9RcLqt7TXTvGmVv1tWVYUW3yZjEIzJxJAKYimXczdkhzaKsUrpmSQQicWqYdIZl
         YHiz3NHQbJKH+8nt/J55lKX6ayjG7soHd6co2fc9AWFRve3e5uHOfmHeLAoWnOUqHMAC
         sKpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="DL/8Id8b";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.182 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-zteg06011501.me.com (mr85p00im-zteg06011501.me.com. [17.58.23.182])
        by mx.google.com with ESMTPS id wy4-20020a170906fe0400b0078db89b2566si533538ejb.699.2022.11.17.06.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.182 as permitted sender) client-ip=17.58.23.182;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="DL/8Id8b";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.182 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1668693700; bh=tYCNi8aTBNQGFX0N6hMYLcRuoK+1KrW9zCSzQ+V9Z1U=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=DL/8Id8bvEvuJtE5w/jVVUtvWA22DOMcoOJ8CT+gR4LVDV0xtx+E4HAF5GxxrZsyj
	 n9S4p06eq44kwVZgzADgP8IvI25dsUNbbJz2NGhWf8s1kkoPBSYqjE7/ub9r3Mxh7H
	 cRW9LKKCSEA369uT4S1VVHWy8qirWvC306NbfJE5nQ1s7StWJ7bWmlCY/w1YHCx+yK
	 b2sfl8VHiq06uoTm3ZvIA0RWqgrKva7ABuTPjJneGt/M6e1zS9zykxU9DrFtEyTAAB
	 Tu22d+fjES6HWTh7q6wmDA/2jj1gdOAjjk7sIbXGQkTb/BOD8MqHrmdOPJXREgs852
	 /k+4IqhAmf1tA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-zteg06011501.me.com (Postfix) with ESMTPSA id F19E9480BEA;
	Thu, 17 Nov 2022 14:01:37 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v2 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221116174749.65175-4-fcagnin@quarkslab.com>
Date: Thu, 17 Nov 2022 15:01:25 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F49251B5-72CD-47FD-AE00-E6F8DA1E9D03@ynddal.dk>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-4-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: FgiAPOLU39HsHLIUQwgzl9pJ7bmlDTYS
X-Proofpoint-ORIG-GUID: FgiAPOLU39HsHLIUQwgzl9pJ7bmlDTYS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=331
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1030
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2211170106
X-TUID: ou1z6tsUmf1r


> On 16 Nov 2022, at 18.47, francesco.cagnin@gmail.com wrote:
> 
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> This proved to be required when debugging the Linux kernel's initial
> code, as the Hypervisor framework was triggering 'EC_SYSTEMREGISTERTRAP'
> VM exits after enabling trap exceptions with
> 'hv_vcpu_set_trap_debug_exceptions()'.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> target/arm/hvf/hvf.c | 140 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 140 insertions(+)

Looks good to me.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>
