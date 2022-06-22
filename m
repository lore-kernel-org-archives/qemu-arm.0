Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2479576lft;
        Wed, 22 Jun 2022 15:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/haWN9XVSWrY+e3d9w+LI1z+VXjxEVU9s+ez/YerlK/THxQBF0OXlJbnfJB3DwIjpbaDl
X-Received: by 2002:a05:620a:12a7:b0:6a6:b847:f62b with SMTP id x7-20020a05620a12a700b006a6b847f62bmr4005280qki.345.1655935524028;
        Wed, 22 Jun 2022 15:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655935524; cv=none;
        d=google.com; s=arc-20160816;
        b=hI8PLCyWlFdlkgrmS4QP2Q2An/RK0cbx7+rJCy+hl+ErlvemsCYHKCflTn4MttNvMe
         2zgwYtqcXEQ2LJuZwKnsJEc2OlqV402HHjrKDU8wu/WRo45hrhrATbrFqn7Nn3iKtUWK
         Nok3TkjucBoMpwoYZmTuU6uZO9YHTc9e5h6Mx9h9p9bU9H3Hmmi5QlWSkH3W7IJqdmei
         aKZ/mfQ+eAFDLUQCaZ/GJOmhGKUcuyz90t9Hwiu+su3rayeAnaNnIzSbL/Br/e1tc1jt
         jesH8cfKPF5OqqVnd9XBogDIZS45t3r8tE7g3BCvKkqnKXZFklF/X/KXGON41IYLHmHm
         2f4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uHRd7TkuzOMjgLA8Oi6i6lW6r0fsP37LWClYU4ygYak=;
        b=JQyfD6F5Tu63kwswz1MGDywrWjaDous452foi3PwfkY5T4sqIyXb5BdTa83UW1gGL9
         FYekSF/bRwPqVBapwan71fhX72HJP/dP97A9hmgwWQJ5vufcjwdVsxMxip1WKxbTEghm
         cnxEgbITno/yWUjosl3MxOjTwk5yf/eLwDGPgMAiwkKsSSUDMIQhemdG87H0i7mLekxY
         V/yEOCZ2IKbOMe/qdCv+AUOnWjFTArHfUTS+DQyrreCL86gKBqh7SRrqaN5E8xduDX6j
         pDG2ijsVBIEQplHgqIQkyjJFJgR4iKGcUWJv0+AfKeQWVhQlWFDaOX0RhLewi0fzB87D
         T+Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=SF02xNmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a05620a298f00b006a6d11918e8si15827354qkp.650.2022.06.22.15.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 15:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=SF02xNmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o48TT-0004uy-FX
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 18:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Sr-0004ue-8R; Wed, 22 Jun 2022 18:04:46 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Sn-0007D5-TO; Wed, 22 Jun 2022 18:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655935481; x=1687471481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uHRd7TkuzOMjgLA8Oi6i6lW6r0fsP37LWClYU4ygYak=;
 b=SF02xNmm686Szgx/jM1MfUmEi0EBQWeSEMH1dhPrub5lk4+5C/YSdtfM
 asDaYOP5uQUbWPpK+oi+CrQJ0aq3VDQmYTaHZjNtSSX1M/B4kiudqIQqd
 hxAN9ywd95dgt0KWYV4kBsx+sTzKm2tOznNAewDwBSzNl3+HsqaSbgwbT k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 15:04:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 15:04:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 15:04:38 -0700
Received: from [10.110.81.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 15:04:37 -0700
Message-ID: <ba7cda55-1f6b-8cda-ea1a-1d4e71de8b3a@quicinc.com>
Date: Wed, 22 Jun 2022 15:04:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
CC: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley
 <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>, "Maheswara
 Kurapati" <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-6-quic_jaehyoo@quicinc.com>
 <CAMvPwGp6Rr3g5Rn3jAU1ZK_99oxrx6z=4ggUWFheL_ipQnJfHQ@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CAMvPwGp6Rr3g5Rn3jAU1ZK_99oxrx6z=4ggUWFheL_ipQnJfHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpJVAqoWyGcd

Hello Titus,

On 6/22/2022 1:49 PM, Titus Rwantare wrote:
> On Wed, 22 Jun 2022 at 10:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>>
>> Current implementation of the pmbus core driver treats the read request
>> for page 255 as invalid request and sets the invalid command bit (bit 7) in the
>> STATUS_CML register. As per the PMBus specification it is a valid request.
>>
>> Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE, on the page 58:
>> "Setting the PAGE to FFh means that all subsequent comands are to be applied to
>>   all outputs.
>>
>>   Some commands, such as READ_TEMPERATURE, may use a common sensor but be
>>   available on all pages of a device.  Such implementations are the decision of
>>   each device manufacturer or are specified in a PMBus Application Profile. Consult
>>   the manufacturer's socuments or the Applicatin Profile Specification as needed."
>>
> Thanks for this, the copy of the spec I used was older.
> 
> 
>> For e.g.,
>> The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
>> refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
>> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>>
>> Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")
>>
>> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>> ---
>>   hw/i2c/pmbus_device.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
>> index 62885fa6a15e..7db3343a83b6 100644
>> --- a/hw/i2c/pmbus_device.c
>> +++ b/hw/i2c/pmbus_device.c
>> @@ -291,7 +291,6 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>>           qemu_log_mask(LOG_GUEST_ERROR,
>>                         "%s: tried to read from all pages\n",
>>                         __func__);
>> -        pmbus_cml_error(pmdev);
>>       } else if (pmdev->page > pmdev->num_pages - 1) {
>>           qemu_log_mask(LOG_GUEST_ERROR,
>>                         "%s: page %d is out of range\n",
>> --
>> 2.25.1
>>
> 
> Please also update the stale comment just above, since this is now
> specified behaviour.

Right. The error log printing also needs to be removed so I'll revise 
this fix like below in v2.

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a15e..749a33af827b 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -284,14 +284,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)

      /*
       * Reading from all pages will return the value from page 0,
-     * this is unspecified behaviour in general.
+     * means that all subsequent commands are to be applied to all output.
       */
      if (pmdev->page == PB_ALL_PAGES) {
          index = 0;
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: tried to read from all pages\n",
-                      __func__);
-        pmbus_cml_error(pmdev);
      } else if (pmdev->page > pmdev->num_pages - 1) {
          qemu_log_mask(LOG_GUEST_ERROR,
                        "%s: page %d is out of range\n",

> Reviewed-by: Titus Rwantare <titusr@google.com>

Thank you so much for your review.

Regards,
Jae
