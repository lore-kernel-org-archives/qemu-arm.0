Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1883837ejc;
        Fri, 10 Mar 2023 05:06:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9cS5BANuOCnVAla5NNU2NiMtIZ3h5mM35LjSF3X3lWBNw+cJlQhoD0jueFlYDe0mKTpxs2
X-Received: by 2002:a05:600c:3ba3:b0:3e2:91c:7cb7 with SMTP id n35-20020a05600c3ba300b003e2091c7cb7mr2781760wms.39.1678453565534;
        Fri, 10 Mar 2023 05:06:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678453565; cv=none;
        d=google.com; s=arc-20160816;
        b=nhqHV5isj49N7rMg7olOjmE9d1L0gWxNgJJmr0xhwlYKuOMXES6xheid75Vk4NKhtK
         Ykxt/1S7y2oNltMIDvgQBXdGwwAuX8UyJZEcc6w92suq6Vuhxy5wZT9+VdUc4Eb6cN0w
         XSb5tWpT8ua3bUfGrQV4WIWp89Sl4CwcWEY451zMf+7fDLSOzAHzmyb+pNQigSDfBN7H
         TihitsWsnL68qzCymRAAhCXOAztiQUl86w+cHr0KS9Z+xy4to82OSJqYpB/GkBQdrFHm
         U4rZYW55NKJTjWP6PIyIOAaKRH5VKvmTKht4K4fGKFMtCNj/1IcxrXTvHfufePPDiyWz
         MIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=2k9+tpCAeN/8/On3DVhNJslrvVdEZxM6eN5p2uLU9rA=;
        b=kpFpv0ZwQeMMpL5cZbdxb/DMeT8HTJqjVmi5hvWyoDU+UdXfrrwER94cNSKwMkGxgq
         XEcqHYTk/F+QHj7aq3//D1Zb2LqwWx158iyRHJgcLzXdtzjReO16SEW5jYP4QHvUQmdH
         CbrxQXp3p2Wof+EAqdPQMSGmFMpx8oxPq+n6SARpjGAZ9SMvtc1DEK+Lhlj2lZNwDXwA
         svOdmj5NpS2yxzEQSqFhcYJqaRwD9LqmPObRzDmoPfpL3ZX9JAnRrKcV/P5MftYEsIMz
         IEgZ+ADPZ0tXbV7Pb01hG81rMDl8280Rkg8rLDdQJ2C4/EF8ip9LxzXGcmvgddEY4fPN
         yFEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="nYI/2EjY";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=vnzeLboL;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id iv14-20020a05600c548e00b003e00e77305asi1921952wmb.75.2023.03.10.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:06:05 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="nYI/2EjY";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=vnzeLboL;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF1E820659;
	Fri, 10 Mar 2023 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678453564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2k9+tpCAeN/8/On3DVhNJslrvVdEZxM6eN5p2uLU9rA=;
	b=nYI/2EjYkdQ8q7VdzUc/CEWOCc2kMDRFV8NyoA3iXjCvI50T8rBkPf3bhEbWWJ6iMmEaz0
	0VzQxyhZplFzEZANe26YsHMPRmn21PK5pQq0qrEcn8KBbqqzxZd3yzFUe1u98Ujx3uTIfl
	GSdCQA2Pi0/yM/InHjr39ifPS1eDVSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678453564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2k9+tpCAeN/8/On3DVhNJslrvVdEZxM6eN5p2uLU9rA=;
	b=vnzeLboL+aKoH6y59nC3FmrgR+xq3JoRJspjhURS0nI6WR1HBAHQFsagQbJ8sd0eabQfaM
	NqkzfL/Hf6tAPsDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 647EB13592;
	Fri, 10 Mar 2023 13:06:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GH7GCzwrC2SvNAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:06:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <20230310050550-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org>
Date: Fri, 10 Mar 2023 10:06:01 -0300
Message-ID: <87h6useoxy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: UO7a3zUDrli3

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>> 
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>> 
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>> 
>> Make sure that calls to qtest_has_accel are placed after g_test_init
>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>> printed before other messages") to avoid TAP parsing errors.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I don't like it that we are hard-coding the list of accelerators
> like this. Make a wrapper?
>

Are you thinking of some sort of "has_any_accel" wrapper?

Some of the code uses has_tcg/kvm for other purposes, so there would be
slight duplication. And the issue really is !tcg && !kvm, i.e. other
accelerators are not taken into account.

>> ---
>> This currently affects Arm, but will also affect x86 after the xenpvh
>> series gets merged. This patch fixes both scenarios.
>> ---
>>  tests/qtest/bios-tables-test.c | 10 ++++++++--
>>  tests/qtest/boot-serial-test.c | 10 ++++++++++
>>  tests/qtest/migration-test.c   |  9 ++++++++-
>>  tests/qtest/pxe-test.c         |  7 ++++++-
>>  tests/qtest/vmgenid-test.c     |  8 ++++++--
>>  5 files changed, 38 insertions(+), 6 deletions(-)
>> 
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index d29a4e47af..5cbad2f29f 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -2109,8 +2109,7 @@ static void test_acpi_virt_oem_fields(void)
>>  int main(int argc, char *argv[])
>>  {
>>      const char *arch = qtest_get_arch();
>> -    const bool has_kvm = qtest_has_accel("kvm");
>> -    const bool has_tcg = qtest_has_accel("tcg");
>> +    bool has_kvm, has_tcg;
>>      char *v_env = getenv("V");
>>      int ret;
>>  
>> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_kvm = qtest_has_accel("kvm");
>> +    has_tcg = qtest_has_accel("tcg");
>> +
>
> why are you moving these? init at declaration time is
> generally cleaner.
>

Thomas had asked me to put calls to qtest_has_accel after g_test_init. I
just brought the existing one along for consistency. From the commit
message:

 "Make sure that calls to qtest_has_accel are placed after g_test_init
 in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
 printed before other messages") to avoid TAP parsing errors."

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>          ret = boot_sector_init(disk);
>>          if (ret) {
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>> index 3aef3a97a9..406b4421cc 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -17,6 +17,9 @@
>>  #include "libqtest.h"
>>  #include "libqos/libqos-spapr.h"
>>  
>> +static bool has_tcg;
>> +static bool has_kvm;
>> +
>>  static const uint8_t bios_avr[] = {
>>      0x88, 0xe0,             /* ldi r24, 0x08   */
>>      0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>> @@ -287,6 +290,13 @@ int main(int argc, char *argv[])
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_tcg = qtest_has_accel("tcg");
>> +    has_kvm = qtest_has_accel("kvm");
>> +
>
> and here why do we need them global?
>

I was trying to make things easier when merging this other series that
puts the variables there as well:
https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org

Second time I get asked this so I'll change it for the next version =)

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      for (i = 0; tests[i].arch != NULL; i++) {
>>          if (g_str_equal(arch, tests[i].arch) &&
>>              qtest_has_machine(tests[i].machine)) {
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index d4ab3934ed..7eedee7b2d 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -2459,7 +2459,7 @@ static bool kvm_dirty_ring_supported(void)
>>  
>>  int main(int argc, char **argv)
>>  {
>> -    const bool has_kvm = qtest_has_accel("kvm");
>> +    bool has_kvm, has_tcg;
>>      const bool has_uffd = ufd_version_check();
>>      const char *arch = qtest_get_arch();
>>      g_autoptr(GError) err = NULL;
>> @@ -2467,6 +2467,13 @@ int main(int argc, char **argv)
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_kvm = qtest_has_accel("kvm");
>> +    has_tcg = qtest_has_accel("tcg");
>> +
>
> same. why the move?
>

g_test_init

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      /*
>>       * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
>>       * is touchy due to race conditions on dirty bits (especially on PPC for
>> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
>> index 62b6eef464..935b661dac 100644
>> --- a/tests/qtest/pxe-test.c
>> +++ b/tests/qtest/pxe-test.c
>> @@ -131,11 +131,16 @@ int main(int argc, char *argv[])
>>      int ret;
>>      const char *arch = qtest_get_arch();
>>  
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
>> +        return 0;
>> +    }
>> +
>>      ret = boot_sector_init(disk);
>>      if(ret)
>>          return ret;
>>  
>> -    g_test_init(&argc, &argv, NULL);
>>  
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>          test_batch(x86_tests, false);
>> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
>> index efba76e716..9eb6371ae8 100644
>> --- a/tests/qtest/vmgenid-test.c
>> +++ b/tests/qtest/vmgenid-test.c
>> @@ -165,13 +165,17 @@ int main(int argc, char **argv)
>>  {
>>      int ret;
>>  
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
>> +        return 0;
>> +    }
>> +
>>      ret = boot_sector_init(disk);
>>      if (ret) {
>>          return ret;
>>      }
>>  
>> -    g_test_init(&argc, &argv, NULL);
>> -
>>      qtest_add_func("/vmgenid/vmgenid/set-guid",
>>                     vmgenid_set_guid_test);
>>      qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
>> -- 
>> 2.35.3
