Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BABCAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGUK-0003AE-T8; Thu, 18 Sep 2025 11:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUF-00038D-32
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:23:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUB-0002UL-0Q
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6er9roUx6gbz+8ov8rKgstHF/wkMFsGwFp9xUJwBsK8=;
 b=fwdvvjFbGAPy7lR/YXgVGA6g41rVVffRwa0agvlCldbD2e8id18K/MaUtmHNSBfR+Xbz7G
 Dwd01H3VkHcYFTCq/GbTwNOzBnpNu4asgzZ+iLSOHf3tzKd+ZFbFfWbk3MAZX+xqjuZw67
 WM0Bx8IlOUJ1Rl3QBPAhkxpHaRTrhw8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-mzQsx6w_NeWkOKQhlSZuWw-1; Thu, 18 Sep 2025 11:23:47 -0400
X-MC-Unique: mzQsx6w_NeWkOKQhlSZuWw-1
X-Mimecast-MFC-AGG-ID: mzQsx6w_NeWkOKQhlSZuWw_1758209027
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-777d7c52cc3so1761393b3a.2
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209027; x=1758813827;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6er9roUx6gbz+8ov8rKgstHF/wkMFsGwFp9xUJwBsK8=;
 b=ON9k70vgIgUO0YLyS7jITSl1mF14OPe+ZmXQ5nlGSbR/px9P/zXPoJunSNk6hNR0Rg
 tyAMNDv41RAXTbG9bOwIN1UL4p/JFIVrnhAW5fBNJ6F0PkZ5C94Z7eYmWCB5I49KYfa+
 I4TL3dEmS/iNq/iuzsOvT075GAObkwiRPSs584hzbrrcLoWAKGOBMzu4RCfCKy178Oom
 ksrJnMLYY1oSe2KNv0rpbNia9pF8RFwlmyCzDHPPovybvPn/bFwFj3LGvxdNgG6NGWZN
 NM85DnxRQQG3OjV+ygUo0WKx2WUmn3bryu4sQZ4uzej5ZTLWh7c3/s/y/oKHGCsmMauG
 H1Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKVp5bQoAt3ec75FSQr5nWW/IRv0GccaP59FJadvlPYp5UbKeGH+Nn3IpZGNRf3j/JxnFtME7nlw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/sEmiCZqbIfQE69Fg3+W2D7cW7BBEQ31pDfMT2omnR6lckGGE
 m5ZDIw4haQk7D3VLMYQt/QGgMF6Wvlxco76S7QaF87x/b9oEmwVNQNWxwVSnkKLrXXK4P51YHcI
 KjYjk4JFU0ghAZg0r/DfPR108c4P8D0NX0d9KzNoWqrI8jc3xLMoxjw==
X-Gm-Gg: ASbGncuPfOj2ou57yMu4e5jVg/t1Apcq5BueqYECi52W3lxxGsTsv32JSbSQEt3+z/Y
 9HdXmEmp9yE0DdqRmM6pLC12mM668rYd5UReDH/m4DmsQ2YViT2pZHtiKwc4PujVuCPHOSYO8OK
 j45zrkYQMqY3UO5PGUNppE9cMsZPZghCWlZqyj5Em+6ZshK5YckWhoYhpOyF93dKmE+dKxBNx67
 p2I9mRkeFzeoD0PXJnKmgaxJpH/3P+5VnUeJTskJSEN35qg5bHjNSZ5EsCPsPmcaDjq3Niesu68
 eWP74Ilrhbcv8K1GA44fGD7m7ov9c2maAeyIo5VJ3DzpPDXnzMjAMg==
X-Received: by 2002:a05:6a00:3e1c:b0:77d:eafa:f8c9 with SMTP id
 d2e1a72fcca58-77deb0a40bdmr1548538b3a.32.1758209026428; 
 Thu, 18 Sep 2025 08:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7jsqOJNeF8SCErC4EiBOtppP9BXeCi5h7gusOXbsqKuU9z5wv8T3xLOvlBlTqdcAQbndEIg==
X-Received: by 2002:a05:6a00:3e1c:b0:77d:eafa:f8c9 with SMTP id
 d2e1a72fcca58-77deb0a40bdmr1548471b3a.32.1758209025819; 
 Thu, 18 Sep 2025 08:23:45 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:23:45 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Subject: [PATCH v14 00/27] migration: propagate vTPM errors using Error objects
Date: Thu, 18 Sep 2025 20:53:17 +0530
Message-Id: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOUjzGgC/33SwW7bMAwG4FcpfK4HkqJMqqe9xzAUskU3PrQOl
 CDYEOTdJ/dSDbJ7lCB9IsX/3l0sL3bpXp7uXbbbclnWj7JAfn7qplP8eLN+SWWjIyAPA3F/zus
 5vsWrvV7P76+W85r7ceZow0QuOejKzXO2efnzyf76Xdan5XJd89/PV2647X7v3bCHnlCQVaIPL
 v3Mlk7x+mNa37sNvFGNyD5CBVEfAkwaUqTQIO4LEaB9xBUk6JACewZP2iBcITjsI1yQ0gwGIBC
 ZoEF8jRy04wuCM8Mwq5oNvkGGCiHcR4aCzDYLg6E3lAaRGvH7iBQkeRJgZhekrUQrxB1UotuId
 U5Kc5rTSA0SvhCFg0rC9ifkuBxBSGPbDkKt6EHaoDDOFCOmMqSdWrAKraI7YLbUjiwQnfDI1KY
 Wq9jq0Yhwy63QqOBMQNLUMlVw1cEBsyU3sonIKDbS/8zj8fgHx6LkbPwDAAA=
X-Change-ID: 20250624-propagate_tpm_error-bf4ae6c23d30
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Steve Sistare <steven.sistare@oracle.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13011; i=armenon@redhat.com;
 h=from:subject:message-id; bh=lf/lJB3MI6QK6OCx0qDGMBIpMYLXmjKToMafBFLCXvY=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5e+svebyWyx9FF0O+pdue8MXu/DPBMsn/yM6gu567
 V9ym+d2RykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgInIuzIyXDyg8UCkKcrh1JK0
 J9FWi0snvTZyUsj7V9k9dacGG0PPGYb/Dt1sQZX7FxU78Ly/vzOIzT+9utTmYU/85r/hDLIxMYo
 8AA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TQttnQbIbovlYWBigksXCOM6nKDw76-1MFbPXsAqHxc_1758209027
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hello,

Currently, when a migration of a VM with an encrypted vTPM
fails on the destination host (e.g., due to a mismatch in secret values),
the error message displayed on the source host is generic and unhelpful.

For example, a typical error looks like this:
"operation failed: job 'migration out' failed: Sibling indicated error 1.
operation failed: job 'migration in' failed: load of migration failed:
Input/output error"

This message does not provide any specific indication of a vTPM failure.
Such generic errors are logged using error_report(), which prints to
the console/monitor but does not make the detailed error accessible via
the QMP query-migrate command.

This series addresses the issue, by ensuring that specific TPM error
messages are propagated via the QEMU Error object.
To make this possible,
- A set of functions in the call stack is changed
  to incorporate an Error object as an additional parameter.
- Also, the TPM backend makes use of a new hook called post_load_errp()
  that explicitly passes an Error object.

It is organized as follows,
 - Patches 1-23 focuses on pushing Error object into the functions
   that are important in the call stack where TPM errors are observed.
   We still need to make changes in rest of the functions in savevm.c
   such that they also incorporate the errp object for propagating errors.
 - Patches 12, 13, 20, are minor refactoring changes.
 - Patch 24 removes error variant of vmstate_save_state() function.
 - Patch 25 renames post_save() to cleanup_save()
 - Patch 26 introduces the new variants of the hooks in VMStateDescription
   structure. These hooks should be used in future implementations.
 - Patch 27 focuses on changing the TPM backend such that the errors are
   set in the Error object.

While this series focuses specifically on TPM error reporting during
live migration, it lays the groundwork for broader improvements.
A lot of methods in savevm.c that previously returned an integer now capture
errors in the Error object, enabling other modules to adopt the
post_load_errp hook in the future.

One such change previously attempted:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01727.html

Resolves: https://issues.redhat.com/browse/RHEL-82826

Signed-off-by: Arun Menon <armenon@redhat.com>
---
Changes in v14:
- Addressed two regressions introduced in
  [PATCH 07/27] migration: push Error **errp into qemu_loadvm_state()
  thanks to Akihiko's suggestions.
  a) duplicate error reporting: The previous patch introduced a duplicate
     error message when 'exit_on_error' is false and the migration failed.
     This is not trivial to fix because there is one such scenario in postcopy
     migration where querying the error message using the QMP client or libvirt
     is not possible as the destination abruptly exits.
     However, the logic to print error is put into a separate specific path and
     a comment is added in this path, which can be improved in future to catch the
     specific case.
  b) Ignoring the error in the migration state and reporting local_err:
     Solved this by restoring the patch 07.
- Link to v13: https://lore.kernel.org/qemu-devel/20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com

Changes in v13:
- Akihiko suggested to use error_report_err() instead of warn_report_err().
  We must not prefix error messages with "warning:" unless the error is a non-critical
  failure that can be logged while the program continues to function.
- Removed error_prepend() with ERRP_GUARD() where it is not required within
  the series.
- Link to v12: https://lore.kernel.org/qemu-devel/20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com

Changes in v12:
- Remove error_prepend() calls where no additional information is appended to
  the error string. This also allows us to remove unnecessary ERRP_GUARD().
- Avoid ambiguity by propagating clear messages in errp.
- Add clarity to commit messages throughout the series.
- Link to v11: https://lore.kernel.org/qemu-devel/20250813-propagate_tpm_error-v11-0-b470a374b42d@redhat.com

Changes in v11:
- Remove unnecessary NULL check in postcopy_ram_listen_thread.
- Change error_warn to error_fatal or pass local_err wherever appropriate, because,
  https://lore.kernel.org/qemu-devel/20250808080823.2638861-13-armbru@redhat.com/
  Most changes are in patches 2,24.
- Link to v10: https://lore.kernel.org/qemu-devel/20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com

Changes in v10:
- Remove the patch to propagate most recent error and the patch of refactoring
  vmstate_save_state_v(): 23,24. They are not required because we intend to keep
  the design as is.
- Added 2 new patches
  - patch 25: Rename post_save() to cleanup_save() and make it void
  - patch 20: Return -1 on memory allocation failure in ram.c
- Pass &error_warn or &error_fatal to capture error or exit on error.
- Link to v9: https://lore.kernel.org/qemu-devel/20250805-propagate_tpm_error-v9-0-123450810db7@redhat.com

Changes in v9:
- Re ordering patches such that error is reported in each one of them.
- format specifier enclosed in '' changed i.e. '%d' changed to %d
- Reporting errors where they were missed before. Setting errp to NULL
  in case of retry.
- Link to v8: https://lore.kernel.org/qemu-devel/20250731-propagate_tpm_error-v8-0-28fd82fdfdb2@redhat.com

Changes in v8:
- 3 new patches added:
  - patch 23:
	- Changes the error propagation by returning the most recent error
	  to the caller when both save device state and post_save fails.
  - patch 24:
	- Refactors the vmstate_save_state_v() function by adding wrapper
	  functions to separate concerns.
  - patch 25:
	- Removes the error variant of the vmstate_save_state()
	  function introduced in commit 969298f9d7.
- Use ERRP_GUARD() where there is an errp dereference or an error_prepend call.
- Pass &error_warn in place of NULL, in vmstate_load_state() calls so
  that the caller knows about the error.
- Remove unnecessary null check before setting errp. Dereferencing it is not required.
- Documentation for the new variants of post/pre save/load hooks added.
- Some patches, although they received a 'Reviewed-by' tag, have undergone few minor changes,
	Patch 1 : removed extra space
	Patch 2 : Commit message changed, refactoring the function to
		always set errp and return.
	Patch 8 : Commit message changed.
	Patch 9 : use error_setg_errno instead of error_setg.
	Patch 27 : use error_setg_errno instead of error_setg.
- Link to v7: https://lore.kernel.org/qemu-devel/20250725-propagate_tpm_error-v7-0-d52704443975@redhat.com

Changes in v7:
- Fix propagating errors in post_save_errp. The latest error encountered is
  propagated.
- user-strings in error_prepend() calls now end with a ': ' so that the print is pretty.
- Change the order of one of the patches.
- Link to v6: https://lore.kernel.org/qemu-devel/20250721-propagate_tpm_error-v6-0-fef740e15e17@redhat.com

Changes in v6:
- Incorporated review comments from Daniel and Akihiko, related to few
  semantic errors and improve error logging.
- Add one more patch that removes NULL checks after calling
  qemu_file_get_return_path() because it does not fail.
- Link to v5: https://lore.kernel.org/qemu-devel/20250717-propagate_tpm_error-v5-0-1f406f88ee65@redhat.com

Changes in v5:
- Solve a bug that set errp even though it was not NULL, pointed out by Fabiano in v4.
- Link to v4: https://lore.kernel.org/qemu-devel/20250716-propagate_tpm_error-v4-0-7141902077c0@redhat.com

Changes in v4:
- Split the patches into smaller ones based on functions. Pass NULL in the
  caller until errp is made available. Every function that has an
  Error **errp object passed to it, ensures that it sets the errp object
  in case of failure.
- A few more functions within loadvm_process_command() now handle errors using
  the errp object. I've converted these for consistency, taking Daniel's
  patches (link above) as a reference.
- Along with the post_load_errp() hook, other duplicate hooks are also introduced.
  This will enable us to migrate to the newer versions eventually.
- Fix some semantic errors, like using error_propagate_prepend() in places where
  we need to preserve existing behaviour of accumulating the error in local_err
  and then propagating it to errp. This can be refactored in a later commit.
- Add more information in commit messages explaining the changes.
- Link to v3: https://lore.kernel.org/qemu-devel/20250702-propagate_tpm_error-v3-0-986d94540528@redhat.com

Changes in v3:
- Split the 2nd patch into 2. Introducing post_load_with_error() hook
  has been separated from using it in the backends TPM module. This is
  so that it can be acknowledged.
- Link to v2: https://lore.kernel.org/qemu-devel/20250627-propagate_tpm_error-v2-0-85990c89da29@redhat.com

Changes in v2:
- Combine the first two changes into one, focusing on passing the
  Error object (errp) consistently through functions involved in
  loading the VM's state. Other functions are not yet changed.
- As suggested in the review comment, add null checks for errp
  before adding error messages, preventing crashes.
  We also now correctly set errors when post-copy migration fails.
- In process_incoming_migration_co(), switch to error_prepend
  instead of error_setg. This means we now null-check local_err in
  the "fail" section before using it, preventing dereferencing issues.
- Link to v1: https://lore.kernel.org/qemu-devel/20250624-propagate_tpm_error-v1-0-2171487a593d@redhat.com

---
Arun Menon (27):
      migration: push Error **errp into vmstate_subsection_load()
      migration: push Error **errp into vmstate_load_state()
      migration: push Error **errp into qemu_loadvm_state_header()
      migration: push Error **errp into vmstate_load()
      migration: push Error **errp into loadvm_process_command()
      migration: push Error **errp into loadvm_handle_cmd_packaged()
      migration: push Error **errp into qemu_loadvm_state()
      migration: push Error **errp into qemu_load_device_state()
      migration: push Error **errp into qemu_loadvm_state_main()
      migration: push Error **errp into qemu_loadvm_section_start_full()
      migration: push Error **errp into qemu_loadvm_section_part_end()
      migration: Update qemu_file_get_return_path() docs and remove dead checks
      migration: make loadvm_postcopy_handle_resume() void
      migration: push Error **errp into ram_postcopy_incoming_init()
      migration: push Error **errp into loadvm_postcopy_handle_advise()
      migration: push Error **errp into loadvm_postcopy_handle_listen()
      migration: push Error **errp into loadvm_postcopy_handle_run()
      migration: push Error **errp into loadvm_postcopy_ram_handle_discard()
      migration: push Error **errp into loadvm_handle_recv_bitmap()
      migration: Return -1 on memory allocation failure in ram.c
      migration: push Error **errp into loadvm_process_enable_colo()
      migration: push Error **errp into loadvm_postcopy_handle_switchover_start()
      migration: Capture error in postcopy_ram_listen_thread()
      migration: Remove error variant of vmstate_save_state() function
      migration: Rename post_save() to cleanup_save() and make it void
      migration: Add error-parameterized function variants in VMSD struct
      backends/tpm: Propagate vTPM error on migration failure

 backends/tpm/tpm_emulator.c   |  40 ++---
 docs/devel/migration/main.rst |  21 ++-
 hw/display/virtio-gpu.c       |   5 +-
 hw/pci/pci.c                  |   5 +-
 hw/ppc/spapr_pci.c            |   5 +-
 hw/s390x/virtio-ccw.c         |   4 +-
 hw/scsi/spapr_vscsi.c         |   6 +-
 hw/vfio/pci.c                 |   9 +-
 hw/virtio/virtio-mmio.c       |   5 +-
 hw/virtio/virtio-pci.c        |   4 +-
 hw/virtio/virtio.c            |  13 +-
 include/migration/colo.h      |   2 +-
 include/migration/vmstate.h   |  20 ++-
 migration/colo.c              |  10 +-
 migration/cpr.c               |   6 +-
 migration/migration.c         |  38 ++---
 migration/postcopy-ram.c      |   9 +-
 migration/postcopy-ram.h      |   2 +-
 migration/qemu-file.c         |   1 -
 migration/ram.c               |  16 +-
 migration/ram.h               |   4 +-
 migration/savevm.c            | 334 ++++++++++++++++++++++++------------------
 migration/savevm.h            |   7 +-
 migration/vmstate-types.c     |  53 ++++---
 migration/vmstate.c           | 115 ++++++++++-----
 target/arm/machine.c          |   6 +-
 tests/unit/test-vmstate.c     |  83 +++++++++--
 ui/vdagent.c                  |   8 +-
 28 files changed, 523 insertions(+), 308 deletions(-)
---
base-commit: f0007b7f03e2d7fc33e71c3a582f2364c51a226b
change-id: 20250624-propagate_tpm_error-bf4ae6c23d30

Best regards,
-- 
Arun Menon <armenon@redhat.com>


