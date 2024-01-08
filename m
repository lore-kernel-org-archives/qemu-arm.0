Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2024516ejo;
        Sun, 7 Jan 2024 17:22:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx2APKWyjiPdrs6QiiykJ2YqKIAuhFoP9MnxVvyFdFFgELPz5LqjFPLhwF/uxqyNMZRhhf
X-Received: by 2002:a05:620a:2788:b0:783:17f5:9088 with SMTP id g8-20020a05620a278800b0078317f59088mr3291941qkp.125.1704676962629;
        Sun, 07 Jan 2024 17:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704676962; cv=none;
        d=google.com; s=arc-20160816;
        b=o2oV0eRBnZrg0q9P3sqa6lokoSZ03r9+gixgKlYqZcoyqKLhpJxiVTs3xFKcIvQk2W
         gcnSssJ+32kFRbD87L8gz9X/rEQNo6rhdevq+2Vdh4TCNXhK+Ysjt0vg+uOx2irC0mLY
         BkVzfBIZAs9w2KITZacvl0Bm2VpPiWmkrXPPrUZOoseCYb1MgT8zFK2hc03eIO2+nGA8
         GoNGy94FAarnSXfBicTaJclNqhJQRQ1VXkq4C4Feo5uP5eJ1Y95LQgAvmy12s2oDUOMU
         NIce51vErnUaECONPGpVRkRBkvckTMu0JN7gN6ElIt9hlHl0sQ9IpCQuXoW165tdHDKS
         utmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ksm2/s0Vd75lDfEQF9n6o4uocnJVvUszCCEf/csOooE=;
        fh=jw4YmxRTxWIj3tB8I57VrE1SSRXEGIUlVhBIqxt0pYU=;
        b=Pui3upcSsTMuPcTvlH0QF8VhCKS5rpGDwZomTlb06Vw/1Ics+VMw8Ow1rhqcVP3dH0
         eKGYWBdUCq6iYkOj9I4uFdSlsdCph0Rmjs/+jjZKNoHqlR3y7/BV8tV+WarRq4YIApUV
         c3fHDFYpJV4c/Er5moqcUZM97QnGxSfPnIPqIdNL2UeeuvN890XeSDUqDvLd335/LGRn
         Nm3Cc2zzeCckel/mlSsVqgdiKJWJeJ+xJR49F0uU7JcagAjdil/m5a90fSDH11QWK4Hr
         JpwJOmx6e9z9PF6dsrf7IpmS9E1OkdTIpqvI75X9KVpncrAUR67ZuPx5lhYtXpqTfLz7
         Eqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XzRPD6Ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a244400b00783100ada16si4751779qkn.259.2024.01.07.17.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jan 2024 17:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XzRPD6Ju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMeLH-0007KR-9S; Sun, 07 Jan 2024 20:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeLE-0007Jq-Qd
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeLB-0007G2-VB
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704676928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksm2/s0Vd75lDfEQF9n6o4uocnJVvUszCCEf/csOooE=;
 b=XzRPD6JuicGqvyMX+PkkBWltoRy2dcLJXcgz2nx9Nlwd/0fFbBehjukhaAuIjuaiEtZr6S
 kvBY0AUdnRBSgOaEBeo2hlG9yKSgFvZmSyBKlq+Mh46Aw3hRCi/4kBiOSXBTJPP3Si0mmV
 YA90ufs0rFkdzpXYmp+GQLbySV5LrE4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-38wIaRBTN-yHxtbszRnE2g-1; Sun, 07 Jan 2024 20:22:06 -0500
X-MC-Unique: 38wIaRBTN-yHxtbszRnE2g-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1d4b2a95f70so14886055ad.0
 for <qemu-arm@nongnu.org>; Sun, 07 Jan 2024 17:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704676926; x=1705281726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ksm2/s0Vd75lDfEQF9n6o4uocnJVvUszCCEf/csOooE=;
 b=khEJVRnchXh9bbZbYK3I6awkyCObRQd3gr4n/qkTUl9T7A5hBz+Wthw8tsOdeJ4VYE
 eHCoFTppbQdyTFs9NS89E44Ew7296WsWL8o5itFS7InTOtMulOxagzystkOIFUwHQ041
 PxR51QMu75gyVZceuDGFULecOWXKSogHQ/p+gPA5aMWnYZXCVdT9HQduTEYylaLuNl4X
 ALzTrGQti8ZjWxIdAY5R58sZI9/Ny2rNZo+LSPOZPf1HzchxOdR55WdLWCPr877gInW3
 LGdbTvMb69L1W2ctQLPMW4anO+LMd0cBnY+5YpQZh3lBeOAEiaviisrfTqfKJwGn9kJL
 ZfBA==
X-Gm-Message-State: AOJu0YwxpgJM/xR5zcKMdICVYpAc3+M56pftQITIjX4yBJBZs18ydXxs
 HVYDlTCw9cubG5iy3gXfXW+GXv84qY+UyjjyqPoVkcNnwOsa3CDw5Srkid8dJKsSJctkPvwF4Fi
 yV4iShEb6wLq46isUzB1T
X-Received: by 2002:a17:902:ecc1:b0:1d4:bc19:d7cc with SMTP id
 a1-20020a170902ecc100b001d4bc19d7ccmr4092424plh.116.1704676925765; 
 Sun, 07 Jan 2024 17:22:05 -0800 (PST)
X-Received: by 2002:a17:902:ecc1:b0:1d4:bc19:d7cc with SMTP id
 a1-20020a170902ecc100b001d4bc19d7ccmr4092391plh.116.1704676925407; 
 Sun, 07 Jan 2024 17:22:05 -0800 (PST)
Received: from [10.72.112.108] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a170902d3d500b001d3f5cfa741sm4960557plb.283.2024.01.07.17.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jan 2024 17:22:04 -0800 (PST)
Message-ID: <de2e49be-4bc1-4cf0-a3eb-4f67630c8009@redhat.com>
Date: Mon, 8 Jan 2024 11:21:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/9] machine: Improve is_cpu_type_supported()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
 <20231204004726.483558-4-gshan@redhat.com>
 <3ef0442a-800c-47ac-a685-2f31b0cb136c@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <3ef0442a-800c-47ac-a685-2f31b0cb136c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ungfp106s8gl

On 1/6/24 08:09, Philippe Mathieu-Daudé wrote:
> On 4/12/23 01:47, Gavin Shan wrote:
>> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
>> NULL, which is a program error. Raise an assert on this.
>>
>> A precise hint for the error message is given when mc->valid_cpu_types[0]
>> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
>> when we have mutiple valid entries there is avoided to increase the code
>> readability, as suggested by Philippe Mathieu-Daudé.
>>
>> Besides, @cc comes from machine->cpu_type or mc->default_cpu_type. For
>> the later case, it can be NULL and it's also a program error. We should
>> use assert() in this case.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> v9: assert(mc->valid_cpu_types[0] != NULL)                   (Phil)
>>      assert(cc != NULL);                                      (Phil)
>> ---
>>   hw/core/machine.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 1797e002f9..4ae9aaee8e 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1400,6 +1400,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
>>        * type is provided through '-cpu' option.
>>        */
>>       if (mc->valid_cpu_types && machine->cpu_type) {
>> +        assert(mc->valid_cpu_types[0] != NULL);
>>           for (i = 0; mc->valid_cpu_types[i]; i++) {
>>               if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
>>                   break;
>> @@ -1409,20 +1410,27 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
>>           /* The user specified CPU type isn't valid */
>>           if (!mc->valid_cpu_types[i]) {
>>               error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> -            error_append_hint(errp, "The valid types are: %s",
>> -                              mc->valid_cpu_types[0]);
>> -            for (i = 1; mc->valid_cpu_types[i]; i++) {
>> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +            if (!mc->valid_cpu_types[1]) {
>> +                error_append_hint(errp, "The only valid type is: %s\n",
>> +                                  mc->valid_cpu_types[0]);
>> +            } else {
>> +                error_append_hint(errp, "The valid types are: ");
>> +                for (i = 0; mc->valid_cpu_types[i]; i++) {
>> +                    error_append_hint(errp, "%s%s",
>> +                                      mc->valid_cpu_types[i],
>> +                                      mc->valid_cpu_types[i + 1] ? ", " : "");
>> +                }
>> +                error_append_hint(errp, "\n");
>>               }
>> -            error_append_hint(errp, "\n");
>>               return false;
>>           }
>>       }
>>       /* Check if CPU type is deprecated and warn if so */
>>       cc = CPU_CLASS(oc);
>> -    if (cc && cc->deprecation_note) {
>> +    assert(cc != NULL);
>> +    if (cc->deprecation_note) {
>>           warn_report("CPU model %s is deprecated -- %s",
>>                       machine->cpu_type, cc->deprecation_note);
>>       }
> 
> Since we were getting:
> 
> $ qemu-system-s390x -M none
> QEMU 8.2.50 monitor - type 'help' for more information
> qemu-system-s390x: ../../hw/core/machine.c:1444: _Bool is_cpu_type_supported(const MachineState *, Error **): Assertion `cc != NULL' failed.
> Aborted (core dumped)
> 
> I added a check on mc->valid_cpu_types before calling
> is_cpu_type_supported() in the previous patch. See commit acbadc5a29.
> 

Phil, thanks for fixing it up and it looks good to me.

Thanks,
Gavin

