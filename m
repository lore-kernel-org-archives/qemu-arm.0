Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2637161lfv;
        Mon, 1 Nov 2021 15:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1uokoZi2abQtEK0WdSQVzJMLNhgRMhShQSJ0Kt9TDXQW5i2el1Fdwy9N+8GhMoFHCp7X7
X-Received: by 2002:a4a:84cd:: with SMTP id o13mr11180800oog.33.1635806628783;
        Mon, 01 Nov 2021 15:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635806628; cv=none;
        d=google.com; s=arc-20160816;
        b=vaoUBVmGn3Vl6M9Lafr2VOkLahegbXADAPdHaUl0Sd1vcO5t7rUJSL8N4dSMduXVP/
         poabsLOCm2XvRvvFzJHwDLRYQiEMrIVBDX8yXQ0wfsgDW3dFn7vMDmgjilSs4vhe97i1
         5yTqKwFc+XLVK+8tHYlAajsNPDV+DVRViMcO18uj+XbshYYs4gcVADgGgmKWOmPIeDUT
         UHNHQFDZlgz4x5UHMTPYosndDH5idyTMJEHFZtQ7S0XTechHTL9tjy86IqZAkVngOJoR
         c2Q7mNr2oltBBPXJq9Z5AdSSI3dlZVJmiiXsGsT64Xi9vKTjxkUPSo6UZqEx9GBPFB/S
         i8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3N5RIGSjZG2H0EsKf+cPgcjzVEvWTFPTbcaEybuS2XM=;
        b=VbDy1qSZbpAWoPASGjsWRb8lR+aRquEyvs4reUPK68BfcWs9i9Ob33oGqxEapGwIRA
         vwUImtFa7f+2Apc5/EwdYuNH6AB9x5VkpEwPjfogPbqpcC5gYtc4WqyxQRLISSJqlaKv
         E+t2auc6NWQs2tpilNHdu+Qf/plYzzDmYHBlMvWuwM5dafyHIO9JbTQ8jfvdKKko6qCa
         SzNd1GxChGNuIzRL00knS/Wld/EXeHNDZL7YioR5IjgiR/jqc2JWGWslkJj99bgG01qf
         5hkO4uc5kNPEMqPNs4DAYqrRTU9gbgreYXk1N8CK8oA9bjIxh6KF5o9Rz5wj7TEVxyo+
         B7oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IIXAhYlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si3883360oii.122.2021.11.01.15.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 15:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IIXAhYlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhg1r-0000nJ-V8
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 18:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhg17-0000jJ-0B; Mon, 01 Nov 2021 18:43:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhg14-0007fJ-JO; Mon, 01 Nov 2021 18:43:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id d5so15092904wrc.1;
 Mon, 01 Nov 2021 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3N5RIGSjZG2H0EsKf+cPgcjzVEvWTFPTbcaEybuS2XM=;
 b=IIXAhYlKnrBIm9E+AF6IWGbYFyikWFjQM23WrSvgjMM56Oi9QQLKoPxC60TICUltgU
 KoNKJcvlOE2x9PZ4IgBHRTrmZD0MH3NEhtKqtTIavD8+nZPOY5x3tS/4FIeR1U1nrfCx
 Q1f6zJh4cUUhp8Pi/J6M9Bh+eb+JImKjabo5xRaF+Mi1FMDODTkCdP1lpObVE1mMftSC
 U1X9AOnqdTiY5UOWojDhADpWuPoik/vCAFsdT7Vh5hppXc6/OPOXc8229FEkC+gwUjd4
 qjgb1/qqVst6E5FP7CjbpRZTC2Dm1roKf15dZ+vCvfTIpaDJlWh8AIv0Vhq3NZ7RfDO+
 mavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3N5RIGSjZG2H0EsKf+cPgcjzVEvWTFPTbcaEybuS2XM=;
 b=TvRfNc+3JoOTg55TbR7QWs70N4WBNLWUCHwftTLU4JFZ9hG4+j6HQwRl9gosLuiuGg
 QAVAaUhrOX3fASqgD4QBcxnEoniC9PQ7yoI/1gWtHxnMPUvscc6vwJStinBPB5M+iXQy
 vKjTbxBZAlAm1PBLYVJzBtqtPU3MmmDLQFpjKIjN3+Qy50qe0wKhrXcEsY8QtMeNqiuT
 xT/0TgSLqKChC4mWX2eZOJtnC2sXPrJ22mzDXq3WVXMYvVZNO0XambNL1qkRsqEjgiX1
 tXz+dmo86Gh47W80UXcZRZOyG5la+yb3TwdIn2SjlRpBVFgNjtaHv+gghq+adW53ZNzi
 STFQ==
X-Gm-Message-State: AOAM532sjzUgGLrjcOYcozeVMS9TZc4eSe2aXCuPs6t76PBfBAbvDemm
 fH4Yd2ND0HeDdHnFNRqZmDq9YNoRNKc=
X-Received: by 2002:a5d:4492:: with SMTP id j18mr29138637wrq.397.1635806575832; 
 Mon, 01 Nov 2021 15:42:55 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n5sm692983wme.6.2021.11.01.15.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 15:42:55 -0700 (PDT)
Message-ID: <fa612902-eb25-b169-2a0b-cfa9c3025867@amsat.org>
Date: Mon, 1 Nov 2021 23:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 6/6] tests/acceptance: Rename avocado_qemu.Test ->
 QemuSystemTest
Content-Language: en-US
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-7-f4bug@amsat.org>
 <CAKJDGDaXZ-rT-MECCVBH5H7_=fj9tjA1Z_R-iGGgHZR-iFN4nA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAKJDGDaXZ-rT-MECCVBH5H7_=fj9tjA1Z_R-iGGgHZR-iFN4nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dhwCgC90nOnR

On 11/1/21 20:11, Willian Rampazzo wrote:
> On Mon, Sep 27, 2021 at 1:32 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> To run user-mode emulation tests, we introduced the
>> avocado_qemu.QemuUserTest which inherits from avocado_qemu.QemuBaseTest.
>> System-mode emulation tests are based on the avocado_qemu.Test class,
>> which also inherits avocado_qemu.QemuBaseTest. To avoid confusion,
>> rename it as avocado_qemu.QemuSystemTest.
>>
>> Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/acceptance/avocado_qemu/__init__.py    | 21 +++++++++-----------
>>  tests/acceptance/boot_linux_console.py       |  4 ++--
>>  tests/acceptance/cpu_queries.py              |  4 ++--
>>  tests/acceptance/empty_cpu_model.py          |  4 ++--
>>  tests/acceptance/info_usernet.py             |  4 ++--
>>  tests/acceptance/linux_initrd.py             |  4 ++--
>>  tests/acceptance/linux_ssh_mips_malta.py     |  5 +++--
>>  tests/acceptance/machine_arm_canona1100.py   |  4 ++--
>>  tests/acceptance/machine_arm_integratorcp.py |  4 ++--
>>  tests/acceptance/machine_arm_n8x0.py         |  4 ++--
>>  tests/acceptance/machine_avr6.py             |  4 ++--
>>  tests/acceptance/machine_m68k_nextcube.py    |  4 ++--
>>  tests/acceptance/machine_microblaze.py       |  4 ++--
>>  tests/acceptance/machine_mips_fuloong2e.py   |  4 ++--
>>  tests/acceptance/machine_mips_loongson3v.py  |  4 ++--
>>  tests/acceptance/machine_mips_malta.py       |  4 ++--
>>  tests/acceptance/machine_ppc.py              |  4 ++--
>>  tests/acceptance/machine_rx_gdbsim.py        |  4 ++--
>>  tests/acceptance/machine_s390_ccw_virtio.py  |  4 ++--
>>  tests/acceptance/machine_sparc_leon3.py      |  4 ++--
>>  tests/acceptance/migration.py                |  4 ++--
>>  tests/acceptance/multiprocess.py             |  4 ++--
>>  tests/acceptance/pc_cpu_hotplug_props.py     |  4 ++--
>>  tests/acceptance/ppc_prep_40p.py             |  4 ++--
>>  tests/acceptance/version.py                  |  4 ++--
>>  tests/acceptance/virtio-gpu.py               |  4 ++--
>>  tests/acceptance/virtio_check_params.py      |  4 ++--
>>  tests/acceptance/virtio_version.py           |  4 ++--
>>  tests/acceptance/vnc.py                      |  4 ++--
>>  tests/acceptance/x86_cpu_model_versions.py   |  4 ++--
>>  30 files changed, 68 insertions(+), 70 deletions(-)

>> -class Test(QemuBaseTest):
>> -    """Facilitates system emulation tests.
>> -
>> -    TODO: Rename this class as `QemuSystemTest`.
>> -    """
>> +class QemuSystemTest(QemuBaseTest):
>> +    """Facilitates system emulation tests."""
>>
>>      def setUp(self):
>>          self._vms = {}
>>
>> -        super(Test, self).setUp('qemu-system-')
>> +        super(QemuSystemTest, self).setUp('qemu-system-')
> 
> If you take my suggestion in one of the previous patches, you don't
> need this change here.

Indeed.

>>
>>          self.machine = self.params.get('machine',
>>                                         default=self._get_unique_tag_val('machine'))
>> @@ -515,11 +512,11 @@ def default_kernel_params(self):
>>          return self._info.get('kernel_params', None)
>>
>>
>> -class LinuxTest(Test, LinuxSSHMixIn):
>> +class LinuxTest(QemuSystemTest, LinuxSSHMixIn):
>>      """Facilitates having a cloud-image Linux based available.
>>
>>      For tests that indend to interact with guests, this is a better choice
> 
> If you touch this patch again, please, s/indend/intend/

OK.

> 
> So far, looks good to me
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>

Thanks for reviewing the series :)
