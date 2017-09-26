Received: by 10.223.172.38 with SMTP id v35csp3710634wrc;
        Tue, 26 Sep 2017 08:29:20 -0700 (PDT)
X-Received: by 10.80.152.68 with SMTP id h4mr18140480edb.205.1506439760396;
        Tue, 26 Sep 2017 08:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506439760; cv=none;
        d=google.com; s=arc-20160816;
        b=sFYRVMkY//os5hZFCdJLL2nJTPIO8VY3gAyUHBM7N5BuUSRT2ZhidUSsWgxC0pPIzG
         qmjFFawQN3jYg6pMRSAop1hUYTyodrNx+3BOO74eRFfXi/s87ZJ9W0ulWgfdIAwIOiKo
         a1SyNMTnOARHF44r8b/YhJiD0oC13mObIBQDOLcAXcipOlZCTUNXTmtoE+a+MkxtfUwZ
         ZvmCS7loL+RGRDyFB332RUSOrh21W35930Mv71sDYonM51Uk+U6sw46uk9CLP5OqIFjw
         xrG04dVYxjltMu2W+J5bqwpIOggfpR7sqgOEanWn75NaHf6vQHEz/YA9EqIzAOdRisdZ
         emmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ile8feiK1Wh3VZp0uboqWVTugVe1tACLYLdtZ4VDv4A=;
        b=dal3t0F6n9e+cJ+48R6aNrCYGAVtYuXNX5XREtv1gh80Tz+MwFlH9MO0cVpO0fKG7N
         GhYdIxSUGFlSb4nthDTbd/BSOkFp15eVedFrunLVt4SkICVOTL1NpyJh0JSVD4lxrIpy
         3WuZnJFEE3HfFeVytTmkvdQZsLaEzZTkQhNjf0lOXuqJJB1r+KR+P34O2jKG02aPyL6m
         mylD7jKp9CiPPdT5A21dDlQDpC+/9jOa9zzeDN+X0m7i5RMHXbEb+J1up5Nb9azc7VHy
         8ZzN18jFYNB6VEn85p5fSthxqqc+AmlWEL6hZb6tf7BI7OFtX6eCdDcmO3ptKiAg32qJ
         qCKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN3FIm87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si2680589edf.446.2017.09.26.08.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 08:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN3FIm87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwrnT-00017I-Do
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 11:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwrmd-0000nl-HC
	for qemu-devel@nongnu.org; Tue, 26 Sep 2017 11:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwrmc-0002MA-LX
	for qemu-devel@nongnu.org; Tue, 26 Sep 2017 11:28:27 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:45905)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwrmc-0002LG-E7
	for qemu-devel@nongnu.org; Tue, 26 Sep 2017 11:28:26 -0400
Received: by mail-wr0-x22c.google.com with SMTP id m18so13548717wrm.2
	for <qemu-devel@nongnu.org>; Tue, 26 Sep 2017 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ile8feiK1Wh3VZp0uboqWVTugVe1tACLYLdtZ4VDv4A=;
	b=UN3FIm87RtEeOLg9ZQX3hEj60j6vKB51nWR3a2T2oOVe+6SRNNyxstO+jx8v8wFz7F
	Jq68x/a+5+Q5FXhL4ORBjXveIKRwaOMQ2h0M6/v/MpucAwH0+y9Lr8bEI0rh8Rx3FuV7
	TqhvS2ZNNxlLo4aEVeoa9OEZBZEIwM8Vidrmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ile8feiK1Wh3VZp0uboqWVTugVe1tACLYLdtZ4VDv4A=;
	b=XxWzfOhznUfE4OPwuWEEA+YuKWQiPNORCjKZ++Jsnvy/tmyTg86AUosRA/8UbdeUXt
	UW1SE5gwe6lYpCWORjM67IcWKRJSVrSfk1vhZ5w/lsBfJaMDbLp2nlW0R0/dHo46nxHF
	Tp8Fi8yXjMID1BBIO6ck+1TnLynCBbfG/BD8/N7QKfHoMgNkwg3RAbUY7TYC4uiDT6x4
	i/AKhY3zUWrXMK4GoMt0CHh0VhWZgTFHMME0SnU879DjtDic6rlJD6XZ1fDP9hkoMSao
	niXMmmPYmIeySdNPLNmchBgScedf6zPrN4YGs4bFLPlyQ6jh808WV2bQqbdR50GwDQD7
	kv5A==
X-Gm-Message-State: AHPjjUhjhcDLQ53m4nJT1lPU3fwujpWRpkWyWUWbDespvFgBp8L8bnrn
	qINa1roo5EgsW7FTDqfhgxjylAL4jvRYivsn9GSINw==
X-Google-Smtp-Source: AOwi7QB6f+sVW8e3bAJPJCUZ7hcOTcEW//sRNCmAdlkndlZTY1glFgeUVA3em7FP4KJu4/Ifx/MbZCPiRb1solJm4RE=
X-Received: by 10.223.147.166 with SMTP id 35mr10849008wrp.90.1506439704018;
	Tue, 26 Sep 2017 08:28:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 26 Sep 2017 08:28:03 -0700 (PDT)
In-Reply-To: <20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
References: <1506088275-31734-1-git-send-email-wei@redhat.com>
	<20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 16:28:03 +0100
Message-ID: <CAFEAcA_Wk5U89QAUHx0tsJR57LLASgnKwtMQk9-PY7sBZAm+hg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS system
 version to mc->name
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++E0oXDypppv

On 26 September 2017 at 11:54, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Sep 22, 2017 at 08:51:15AM -0500, Wei Huang wrote:
>> Instead of using "1.0" as the system version of SMBIOS, we should use
>> mc->name for mach-virt machine type. This matches with x86 code and
>> prevents the smbios_table.machine_type test of Avocado from failing.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9e18b41..8d0c6a9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>
>>  static void virt_build_smbios(VirtMachineState *vms)
>>  {
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>      uint8_t *smbios_tables, *smbios_anchor;
>>      size_t smbios_tables_len, smbios_anchor_len;
>>      const char *product = "QEMU Virtual Machine";
>> @@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>>      }
>>
>>      smbios_set_defaults("QEMU", product,
>> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
>> +                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
>>
>>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>>                        &smbios_anchor, &smbios_anchor_len);
>> --
>> 2.7.5
>>
>>
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Are we OK to change this without having to tie it to the machine
version number?

thanks
-- PMM
