Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2437969lfg;
        Sat, 20 Mar 2021 16:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW0VQ0bYzNVRZqzDynh3iHn7iBzj5ncUynG6JmriGrkQx28hV+U2PJ+SqGud0Ehmm5ZrLv
X-Received: by 2002:a5b:448:: with SMTP id s8mr15144481ybp.363.1616283152801;
        Sat, 20 Mar 2021 16:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616283152; cv=none;
        d=google.com; s=arc-20160816;
        b=EUu0lo4sWX6MYJY4J2jASeikrX7QNHiAsQtlALUMORu84zImLt4/dod/YJ8kLrprph
         Ce2bYQ0zH/SULxKKisvm26Cmgh3XwO0+7JNdQdOKuqGfLs6N1NX4AOxOWqf6Pyi9+0fw
         ylFulDs7zB5VSbsU3GxjrLmChwdVU/Gxd1wiEVVs7BGg8flSZOCcec+wC/farQf1r542
         vEzmDE2kwIlC99o/rtOEf441CntBtm1if8rGeFIp4LfgaoL7+7Xg2NQM9fSk3CxkVrdX
         XHoSw6UmwXWearv6aybgL+PqdQvMvVf8NjZ3yTAqo1JM+boRueIw6DKf53XQdeJAJfkY
         gP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=iCYYseaEC719ARq0lsD/HuX0KAgDJ59JDw4vcSkw/mE=;
        b=Z2xbM8HExooce6zbO2KhEHrSV4eqC/+zGiZi08GdlOvyWur8Zu4dARzQnZDWB904LY
         yEWZsThhJpUvTHHXJuFANFesXHfDI2iTiFx/+62DbNxyirLAw8TTW1llGpVosuROlktn
         n36hNSOEkTS/wTmC1m3+TjPbL37xQ3PhcDwLiQiIxr5RWfYPMK0KmK4fwVMS7z3UvZRX
         3dly64Jew1E6CIu69rT2KpbOwXI0ZUTC7mtOI88Bs6A/wsbuJIMJ/fQw88m8Rk2WVo+k
         leOu0zjUHSsefPXQW8ZXW+TwdMc7Q5mkkVhMQNeaWxMLfXZlnNaf45SxfAB6XSHc/XBR
         AipQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EGUO/rqV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si742652ybq.408.2021.03.20.16.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Mar 2021 16:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EGUO/rqV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNl56-0006j4-0o
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 19:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl4t-0006io-4C
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 19:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl4p-00066P-8q
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 19:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616283133;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCYYseaEC719ARq0lsD/HuX0KAgDJ59JDw4vcSkw/mE=;
 b=EGUO/rqVdrcYywsfWonA5A3w8PIkpdMOLoTeeWIlH6B1jkBbh5NepBeDxHqb6aFBnXGlQs
 LQ9UjXKmMK0B+CIb5LWMR2fxT2KfFaeFcuUVxFyN09X+aqAT3huqJLDyw5qrQ8h6fVLBTa
 SY0sZsb3bvfe6ttUCl9GUIzIKtNAML0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-K6ckKasxPPajUC-jlXHATQ-1; Sat, 20 Mar 2021 19:32:11 -0400
X-MC-Unique: K6ckKasxPPajUC-jlXHATQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625F651F9;
 Sat, 20 Mar 2021 23:32:10 +0000 (UTC)
Received: from [10.64.54.40] (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F115919C79;
 Sat, 20 Mar 2021 23:32:06 +0000 (UTC)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <584e6cec-dd1d-7aa5-5f67-43bfcd9ae66a@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <34b8e906-7e3f-197d-78ad-34b973c7b77e@redhat.com>
Date: Sun, 21 Mar 2021 10:32:02 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <584e6cec-dd1d-7aa5-5f67-43bfcd9ae66a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: richard.henderson@linaro.org, laurent@vivier.eu, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 55xYWN2tvZ2d

Hi Thomas,

On 3/20/21 3:48 PM, Thomas Huth wrote:
> On 20/03/2021 05.27, Gavin Shan wrote:
>> It's still possible that the wrong value is returned from the alias
>> of variable even if the program can be compiled without issue. This
>> improves the check by executing the binary to check the result.
>>
>> If alias attribute can't be working properly, the @target_page in
>> exec-vary.c will always return zeroes when we have the following gcc
>> version.
>>
>>    # gcc --version
>>    gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
>>
>> This abstracts the code from exec-vary.c and use it as indicator to
>> enable gcc alias attribute or not.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   configure | 34 ++++++++++++++++++++++++++++++----
>>   1 file changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/configure b/configure
>> index f7d022a5db..8321f380d5 100755
>> --- a/configure
>> +++ b/configure
>> @@ -75,6 +75,7 @@ fi
>>   TMPB="qemu-conf"
>>   TMPC="${TMPDIR1}/${TMPB}.c"
>> +TMPC_B="${TMPDIR1}/${TMPB}_b.c"
>>   TMPO="${TMPDIR1}/${TMPB}.o"
>>   TMPCXX="${TMPDIR1}/${TMPB}.cxx"
>>   TMPE="${TMPDIR1}/${TMPB}.exe"
>> @@ -4878,13 +4879,38 @@ fi
>>   attralias=no
>>   cat > $TMPC << EOF
>> -int x = 1;
>> +static int x;
>>   extern const int y __attribute__((alias("x")));
>> -int main(void) { return 0; }
>> +extern int read_y(void);
>> +void write_x(int val);
>> +
>> +void write_x(int val)
>> +{
>> +    x = val;
>> +}
>> +
>> +int main(void)
>> +{
>> +    return read_y();
>> +}
>>   EOF
>> -if compile_prog "" "" ; then
>> -    attralias=yes
>> +cat > $TMPC_B << EOF
>> +extern const int y;
>> +extern void write_x(int val);
>> +int read_y(void);
>> +
>> +int read_y(void)
>> +{
>> +     write_x(1);
>> +     return y;
>> +}
>> +EOF
>> +
>> +TMPC+=" ${TMPC_B}"
>> +if compile_prog "" "" && ! $TMPE; then
> 
> What about cross-compiling? Running an executable won't work if QEMU gets cross-compiled...
> 

Executing the cross-compiled binary returns 126, which means we will
disable gcc alias attribute for cross-compiling case with the following
changes included into v2:

int main(void) { return (read_y() == 1) ? 0 : 1; }

if compile_prog "" "" && $TMPE >/dev/null 2>/dev/null; then
    attralias=yes
fi

Thanks,
Gavin

